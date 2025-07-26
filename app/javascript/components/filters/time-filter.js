import { DateTime } from "luxon";

export const lxFormatDate = (value) => {
    return DateTime.fromISO(value).toFormat("dd.MM.yyyy");
}

export const lxDueIn = (value, unit = 'days') => {
    const dateValue = DateTime.fromISO(value).diff(DateTime.now(), unit)[unit];
    return Number(dateValue).toPrecision(2) + " " + unit;
}