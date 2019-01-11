From: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-devel] [PULL 00/25] xen queue
Date: Fri, 11 Jan 2019 13:35:29 +0000
Message-ID: <CAFEAcA-RQkXCvijrDkQY=QADq4O6c60ab1d-9oeq+vdObtQiUw__20654.2218955748$1547213730$gmane$org@mail.gmail.com>
References: <20190110134917.16425-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=p0N+=PT=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1ghwyL-0007Sy-TR
 for xen-devel@lists.xenproject.org; Fri, 11 Jan 2019 13:35:41 +0000
Received: by mail-oi1-x22e.google.com with SMTP id c206so12227033oib.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Jan 2019 05:35:40 -0800 (PST)
In-Reply-To: <20190110134917.16425-1-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>, QEMU Developers <qemu-devel@nongnu.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAxMCBKYW4gMjAxOSBhdCAxMzo1MiwgQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVy
YXJkQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNv
bW1pdCA4YWU5NTFmYmMxMDY4MzA4MzEzYjJjNTdhNGZjM2M2ODQ1MTY0MWY0Ogo+Cj4gICBNZXJn
ZSByZW1vdGUtdHJhY2tpbmcgYnJhbmNoICdyZW1vdGVzL2RnaWJzb24vdGFncy9wcGMtZm9yLTQu
MC0yMDE5MDEwOScgaW50byBzdGFnaW5nICgyMDE5LTAxLTA5IDE2OjA4OjMxICswMDAwKQo+Cj4g
YXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4KPiAgIGh0dHBzOi8veGVu
Yml0cy54ZW4ub3JnL2dpdC1odHRwL3Blb3BsZS9hcGVyYXJkL3FlbXUtZG0uZ2l0IHRhZ3MvcHVs
bC14ZW4tMjAxOTAxMTAKPgo+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAyNGVkYjkx
ZjUwMDlmYTk0MWUxMjk0YWFmNGJiMjEwM2Q5YWQwNzdlOgo+Cj4gICB4ZW4tYmxvY2s6IGF2b2lk
IHJlcGVhdGVkIG1lbW9yeSBhbGxvY2F0aW9uICgyMDE5LTAxLTEwIDExOjI1OjE3ICswMDAwKQo+
Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQo+IHhlbiBxdWV1ZQo+Cj4gKiBYZW4gUFYgYmFja2VuZCAncWRldmlmaWNhdGlv
bicuCj4gICBTdGFydGluZyB3aXRoIHhlbl9kaXNrLgo+ICogUGVyZm9ybWFuY2UgaW1wcm92ZW1l
bnRzIGZvciB4ZW4tYmxvY2suCj4gKiBSZW1vdmUgb2YgdGhlIFhlbiBQViBkb21haW4gYnVpbGRl
ci4KPiAqIGJ1ZyBmaXhlcy4KPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KCkhpLiBUaGlzIGZhaWxzIHRvIGNvbXBpbGUg
Zm9yIG1lICh4ODYtNjQgTGludXggaG9zdCk6CgogIENDICAgICAgaHcvYmxvY2sveGVuLWJsb2Nr
Lm8KSW4gZmlsZSBpbmNsdWRlZCBmcm9tCi9ob21lL3BldG1heTAxL2xpbmFyby9xZW11LWZvci1t
ZXJnZXMvaW5jbHVkZS9ody94ZW4veGVuLWJsb2NrLmg6MTE6MCwKICAgICAgICAgICAgICAgICBm
cm9tCi9ob21lL3BldG1heTAxL2xpbmFyby9xZW11LWZvci1tZXJnZXMvaHcvYmxvY2sveGVuLWJs
b2NrLmM6MjI6Ci9ob21lL3BldG1heTAxL2xpbmFyby9xZW11LWZvci1tZXJnZXMvaW5jbHVkZS9o
dy94ZW4veGVuLWJ1cy5oOjMyOjU6CmVycm9yOiB1bmtub3duIHR5cGUgbmFtZSDigJh4ZW5ldnRj
aG5fcG9ydF9vcl9lcnJvcl904oCZCiAgICAgeGVuZXZ0Y2huX3BvcnRfb3JfZXJyb3JfdCBsb2Nh
bF9wb3J0OwogICAgIF4KL2hvbWUvcGV0bWF5MDEvbGluYXJvL3FlbXUtZm9yLW1lcmdlcy9ydWxl
cy5tYWs6Njk6IHJlY2lwZSBmb3IgdGFyZ2V0Cidody9ibG9jay94ZW4tYmxvY2subycgZmFpbGVk
CgpQcm9iYWJseSB0aGUgY29kZSBpcyBhY2NpZGVudGFsbHkgYXNzdW1pbmcgYSBuZXdlciB2ZXJz
aW9uCm9mIHRoZSBYZW4gaGVhZGVycyB0aGFuIHRoaXMgc3lzdGVtIGhhcyBpbnN0YWxsZWQ/IFRo
aXMKaXMgVWJ1bnR1IDE2LjA0LjUgd2l0aCBsaWJ4ZW4tZGV2ICA0LjYuNS0wdWJ1bnR1MS40LgoK
dGhhbmtzCi0tIFBNTQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
