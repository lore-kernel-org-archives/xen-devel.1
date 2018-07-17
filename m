From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v4 3/9] osstest: allow appending to existing
 runvars
Date: Tue, 17 Jul 2018 18:03:41 +0200
Message-ID: <20180717160347.60140-4-roger.pau@citrix.com>
References: <20180717160347.60140-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jnja=kb=citrix.com=prvs=72919e7bd=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ffSSq-0001nP-Ia
 for xen-devel@lists.xenproject.org; Tue, 17 Jul 2018 16:04:36 +0000
In-Reply-To: <20180717160347.60140-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+CgpTbyB0aGF0IHRoZSBj
b250ZW50cyBvZiB0aGUgcnVudmFyIGNhbiBiZSBleHBhbmRlZC4gVGhlcmUgYXJlCmN1cnJlbnRs
eSB0d28gd2F5cyB0byBkbyB0aGlzOgoKIC0gVXNpbmcgKz0gd2lsbCBhcHBlbmQgdG8gdGhlIGVu
ZCBvZiB0aGUgcnVudmFyLgogLSBVc2luZyAsPSB3aWxsIGFwcGVuZCB0byB0aGUgZW5kIG9mIHRo
ZSBydW52YXIgdXNpbmcgJywnIGFzIHRoZQogICBzZXBhcmF0b3IuCgpOb3RlIHRoYXQgaWYgdGhl
IHJ1bnZhciBpcyBlbXB0eSB7LHwrfT0ganVzdCBzZXRzIHRoZSBydW52YXIuCgpTaWduZWQtb2Zm
LWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4KLS0tCiBjcy1qb2ItY3Jl
YXRlIHwgOCArKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9jcy1qb2ItY3JlYXRlIGIvY3Mtam9iLWNyZWF0ZQppbmRl
eCAwNjRhOTI5NC4uMTk4MGE2MjUgMTAwNzU1Ci0tLSBhL2NzLWpvYi1jcmVhdGUKKysrIGIvY3Mt
am9iLWNyZWF0ZQpAQCAtNTMsOCArNTMsMTIgQEAgZm9yZWFjaCBteSAkcnYgKEBydW52YXJzKSB7
CiAgICAgICAgICRzdXBwcmVzc3skMX09IDE7CiAgICAgICAgIG5leHQ7CiAgICAgfQotICAgICRy
diA9fiBtL14oW2Etel1bMC05YS16X10qKShcfj8pXD0oLiopJC8gb3IgZGllICIkcnYgPyI7Ci0g
ICAgbXkgKCRuYW1lLCRzeW50aCwkdmFsKSA9ICgkMSwkMiwkMyk7CisgICAgJHJ2ID1+IG0vXihb
YS16XVswLTlhLXpfXSopKFx+PykoWyssXT8pXD0oLiopJC8gb3IgZGllICIkcnYgPyI7CisgICAg
bXkgKCRuYW1lLCRzeW50aCwkYWRkLCR2YWwpID0gKCQxLCQyLCQzLCQ0KTsKKyAgICBpZiAoJGFk
ZCAmJiAkcnVudmFyc3skbmFtZX0pIHsKKyAgICAgICBkaWUgIiRuYW1lIHN5bnRoIG1pc21hdGNo
IiBpZiAhISRydW52YXJzeyRuYW1lfVsxXSBuZSAhISRzeW50aDsKKyAgICAgICAkdmFsID0gJHJ1
bnZhcnN7JG5hbWV9WzBdLigkYWRkIG5lICcrJyAmJiAkYWRkKS4kdmFsOworICAgIH0KICAgICAk
cnVudmFyc3skbmFtZX09IFskdmFsLCRzeW50aF07CiB9CiAKLS0gCjIuMTcuMQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
