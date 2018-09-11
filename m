From: Andrii Anisov <andrii_anisov@epam.com>
Subject: Re: [PATCH] traps: coding style fixes
Date: Tue, 11 Sep 2018 14:30:17 +0300
Message-ID: <9db56425-768a-04d7-aca7-e0a1659a8b1c@epam.com>
References: <1536650302-3013-1-git-send-email-andrii.anisov@gmail.com>
 <b8c28616-aedb-787f-664b-ef877a046710@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7wzx=lz=epam.com=andrii_anisov@srs-us1.protection.inumbo.net>)
 id 1fzgsY-0004Ii-B7
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 11:30:46 +0000
In-Reply-To: <b8c28616-aedb-787f-664b-ef877a046710@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xen.org
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

Ck9uIDExLjA5LjE4IDEzOjQyLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEBAIC0xNDI5LDcgKzE0
MzAsOCBAQCBzdGF0aWMgdm9pZCBkb19kZWJ1Z190cmFwKHN0cnVjdCBjcHVfdXNlcl9yZWdzIAo+
PiAqcmVncywgdW5zaWduZWQgaW50IGNvZGUpCj4+IMKgIHsKPj4gwqDCoMKgwqDCoCB1aW50MzJf
dCByZWc7Cj4+IMKgwqDCoMKgwqAgdWludDMyX3QgZG9taWQgPSBjdXJyZW50LT5kb21haW4tPmRv
bWFpbl9pZDsKPgo+IFdoaWxlIHlvdSBhcmUgYXQgZml4aW5nIGNvZGluZyBzdHlsZTogbmV3bGlu
ZSBoZXJlLgo+Cj4+IC3CoMKgwqAgc3dpdGNoICggY29kZSApIHsKPj4gK8KgwqDCoCBzd2l0Y2gg
KCBjb2RlICkKPj4gK8KgwqDCoCB7Cj4+IMKgwqDCoMKgwqAgY2FzZSAweGUwIC4uLiAweGVmOgo+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gY29kZSAtIDB4ZTA7Cj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCBwcmludGsoIkRPTSVkOiBSJWQgPSAweCUiUFJJcmVnaXN0ZXIiIGF0IDB4JSJQUkl2YWRk
ciJcbiIsCj4+IEBAIC0yMDcxLDcgKzIwNzMsOCBAQCB2b2lkIGRvX3RyYXBfZ3Vlc3Rfc3luYyhz
dHJ1Y3QgY3B1X3VzZXJfcmVncyAKPj4gKnJlZ3MpCj4+IMKgIMKgwqDCoMKgwqAgZW50ZXJfaHlw
ZXJ2aXNvcl9oZWFkKHJlZ3MpOwo+PiDCoCAtwqDCoMKgIHN3aXRjaCAoaHNyLmVjKSB7Cj4+ICvC
oMKgwqAgc3dpdGNoIChoc3IuZWMpCj4KPiBYZW4gY29kaW5nIHN0eWxlIHJlcXVpcmVzIHNwYWNl
IGFmdGVyICggYW5kIGJlZm9yZSApLgo+Cj4+ICvCoMKgwqAgewo+PiDCoMKgwqDCoMKgIGNhc2Ug
SFNSX0VDX1dGSV9XRkU6Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAvKgo+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAqIEhDUl9FTDIuVFdJLCBIQ1JfRUwyLlRXRQo+PiBAQCAtMjI3MCw3ICsyMjczLDgg
QEAgdm9pZCBsZWF2ZV9oeXBlcnZpc29yX3RhaWwodm9pZCkKPj4gwqDCoMKgwqDCoCB3aGlsZSAo
MSkKPj4gwqDCoMKgwqDCoCB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBsb2NhbF9pcnFfZGlzYWJs
ZSgpOwo+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKCFzb2Z0aXJxX3BlbmRpbmcoc21wX3Byb2Nlc3Nv
cl9pZCgpKSkgewo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCFzb2Z0aXJxX3BlbmRpbmcoc21wX3By
b2Nlc3Nvcl9pZCgpKSkKPgo+IFNhbWUgaGVyZS4KClllcC4KCi0tIAoKKkFuZHJpaSBBbmlzb3Yq
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
