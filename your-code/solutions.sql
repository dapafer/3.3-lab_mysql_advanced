Challenge 1.

SELECT titles.title_id AS TITLE_ID,
		authors.au_id AS AUTHOR_ID,
        titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS SALES_ROYALTIES
FROM titles
		LEFT JOIN titleauthor ON titles.title_id = titleauthor.title_id
        LEFT JOIN authors ON titleauthor.au_id = authors.au_id
        LEFT JOIN sales ON titles.title_id = sales.title_id
        ;
---------
SELECT sq_1.`TITLE_ID`,
		sq_1.`AUTHOR_ID`,
        SUM(sq_1.`SALES_ROYALTIES`) AS AGGREGATED_ROYALTIES
FROM
		(SELECT titles.title_id AS TITLE_ID,
				authors.au_id AS AUTHOR_ID,
				titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS SALES_ROYALTIES
		FROM titles
				LEFT JOIN titleauthor ON titles.title_id = titleauthor.title_id
				LEFT JOIN authors ON titleauthor.au_id = authors.au_id
				LEFT JOIN sales ON titles.title_id = sales.title_id)
		AS sq_1
GROUP BY
		sq_1.`AUTHOR_ID`,
		sq_1.`TITLE_ID`
    ;
---------
(step 3 no he conseguido ejecutarlo)



Challenge 2.

CREATE TEMPORARY TABLE temp_1

SELECT titles.title_id AS TITLE_ID,
		authors.au_id AS AUTHOR_ID,
        titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS SALES_ROYALTIES
FROM titles
		LEFT JOIN titleauthor ON titles.title_id = titleauthor.title_id
        LEFT JOIN authors ON titleauthor.au_id = authors.au_id
        LEFT JOIN sales ON titles.title_id = sales.title_id
        ;
---------
CREATE TEMPORARY TABLE temp_2

SELECT temp_1.`TITLE_ID`,
		temp_1.`AUTHOR_ID`,
        SUM(temp_1.`SALES_ROYALTIES`) AS AGGREGATED_ROYALTIES
FROM temp_1
GROUP BY
		temp_1.`AUTHOR_ID`,
		temp_1.`TITLE_ID`
		;
---------
CREATE TEMPORARY TABLE temp_3



Challenge 3.

CREATE TABLE most_profiting_authors
	(au_id VARCHAR(45) NOT NULL,
    profits DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (au_id))
    ;