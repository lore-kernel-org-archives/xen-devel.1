From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH] sg-report-flight: Provide correct links
 to test history pages
Date: Fri, 27 Apr 2018 15:15:05 +0100
Message-ID: <1524838505-14315-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qvye=hq=citrix.com=prvs=6486f6240=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fC49l-00018a-MT
 for xen-devel@lists.xenproject.org; Fri, 27 Apr 2018 14:15:25 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@linaro.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGZpbGVzIGFyZSBhY3R1YWxseSBjYWxsZWQgYEFMTC5odG1sJyBhbmQgYDxicmFuY2g+Lmh0
bWwnLiAgU2VlIHRoZQphc3NpZ25tZW50cyB0byAkaHRtbF9maWxlIGluIHNnLXJlcG9ydC1qb2It
aGlzdG9yeSBuZWFyIGwuMjUxLgoKSSB0aGluayB0aGlzIG1heSBoYXZlIHByZXZpb3VzbHkgd29y
a2VkIGluIE1hc3NhY2h1c2V0dHMgKHByaW9yIHRvIHRoZQpyZWNlbnQgdXBncmFkZXMpIGR1ZSB0
byBjb250ZW50IG5lZ290aWF0aW9uLCBidXQgdGhpcyBzaG91bGQgbm90IGJlCnJlbGllZCBvbi4K
ClJlcG9ydGVkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBsaW5hcm8ub3JnPgpTaWdu
ZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBz
Zy1yZXBvcnQtZmxpZ2h0IHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3NnLXJlcG9ydC1mbGlnaHQgYi9zZy1yZXBv
cnQtZmxpZ2h0CmluZGV4IGRiYTM2NDEuLmU2OWVmYjcgMTAwNzU1Ci0tLSBhL3NnLXJlcG9ydC1m
bGlnaHQKKysrIGIvc2ctcmVwb3J0LWZsaWdodApAQCAtOTY5LDggKzk2OSw4IEBAIEVORAogPGgx
PiR0aXRsZTwvaDE+CiA8dWw+CiA8bGk+PGEgaHJlZj0iLi4vIj5GbGlnaHQgJGZpLT57RmxpZ2h0
fSBzY29yZWJvYXJkPC9hPgotPGxpPjxhIGhyZWY9IiRje1Jlc3VsdHNIdG1sUHViQmFzZVVybH0v
aGlzdG9yeS8kam9iL0FMTCI+SGlzdG9yeSBmb3IgJGpvYjwvYT4KLTxsaT48YSBocmVmPSIkY3tS
ZXN1bHRzSHRtbFB1YkJhc2VVcmx9L2hpc3RvcnkvJGpvYi8kYnJhbmNoIj5IaXN0b3J5IGZvciAk
am9iIGluIHRlc3RzIG9mICRicmFuY2g8L2E+Cis8bGk+PGEgaHJlZj0iJGN7UmVzdWx0c0h0bWxQ
dWJCYXNlVXJsfS9oaXN0b3J5LyRqb2IvQUxMLmh0bWwiPkhpc3RvcnkgZm9yICRqb2I8L2E+Cis8
bGk+PGEgaHJlZj0iJGN7UmVzdWx0c0h0bWxQdWJCYXNlVXJsfS9oaXN0b3J5LyRqb2IvJGJyYW5j
aC5odG1sIj5IaXN0b3J5IGZvciAkam9iIGluIHRlc3RzIG9mICRicmFuY2g8L2E+CiA8bGk+PGEg
aHJlZj0iLi8iPkxvZ2ZpbGVzIGZvciAkZmktPntGbGlnaHR9ICRqb2IgYXMgd2Vic2VydmVyIGRp
cmVjdG9yeSBsaXN0aW5nPC9hPgogPC91bD4KIDxoMj5TdGVwczwvaDI+Ci0tIAoyLjEuNAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
