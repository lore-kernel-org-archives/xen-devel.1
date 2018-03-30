From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: SVM NPT mem_access and npfec.insn_fetch
Date: Sat, 31 Mar 2018 00:47:57 +0300
Message-ID: <e5eaba22-db72-fb3a-0b16-ec6d0f98f02b@bitdefender.com>
References: <ab363420-e900-da96-35da-664b38d73bcc@bitdefender.com>
 <10feeaab-768e-3d9d-62b5-5ac35788d28b@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=0mje=gu=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1f21sQ-0007oC-Fd
 for xen-devel@lists.xenproject.org; Fri, 30 Mar 2018 21:48:02 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 412303087995
 for <xen-devel@lists.xenproject.org>; Sat, 31 Mar 2018 02:04:00 +0300 (EEST)
Received: from smtp02.buh.bitdefender.net (smtp.bitdefender.biz [10.17.80.76])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 7ECD17FC05
 for <xen-devel@lists.xenproject.org>; Sat, 31 Mar 2018 00:47:59 +0300 (EEST)
In-Reply-To: <10feeaab-768e-3d9d-62b5-5ac35788d28b@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Tamas K Lengyel <tamas@tklengyel.com>, suravee.suthikulpanit@amd.com
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMzEvMjAxOCAxMjoxNCBBTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAzMC8wMy8y
MDE4IDIyOjA2LCBSYXp2YW4gQ29qb2NhcnUgd3JvdGU6Cj4+IEhlbGxvLAo+Pgo+PiBXZSd2ZSBi
ZWVuIHRyeWluZyB0byBlbmFibGUgbWVtX2FjY2VzcyBldmVudHMgZm9yIFNWTSwgYW5kIHdlIGRv
IHJlY2VpdmUKPj4gc29tZSBldmVudHMgd2l0aCB4ZW4tYWNjZXNzIGlmIHdlIHNldCB0aGUgcGFn
ZXMgcmVhZC1vbmx5LiBIb3dldmVyLCB0aGUKPj4gZXhlYyB4ZW4tYWNjZXNzIHRlc3RzIGZhaWxz
LCBiZWNhdXNlIGl0IGFwcGVhcnMgdGhhdCBucGZlYy5pbnNuX2ZldGNoIGlzCj4+IGFsd2F5cyAw
IGhlcmUgKG9yIGF0IGxlYXN0IHdlIGhhdmVuJ3Qgc2VlbiBpdCB0byBiZSAxIGluIGEgbG90IG9m
IHRlc3RpbmcpOgo+Pgo+PiBpbmRleCA1NjliMTI0Li5kNTE4Yzk0IDEwMDY0NAo+PiAtLS0gYS94
ZW4vYXJjaC94ODYvaHZtL2h2bS5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKPj4g
QEAgLTE4MzUsNiArMTgzNSwxMyBAQCBpbnQgaHZtX2hhcF9uZXN0ZWRfcGFnZV9mYXVsdChwYWRk
cl90IGdwYSwKPj4gdW5zaWduZWQgbG9uZyBnbGEsCj4+ICAgICAgICAgICAgICBicmVhazsKPj4g
ICAgICAgICAgfQo+Pgo+PiArICAgICAgICBwcmludGsoInBhZTogJWQsIG54OiAlZCwgZ2ZuOiAw
eCVseCBhY2Nlc3MgJWQgdmlvbGF0aW9uICVkIHJlYWQgJWQiCj4+ICsgICAgICAgICAgICAgICAi
IHdyaXRlICVkIGluc24gJWQgcHJlc2VudCAlZCBnbGF2ICVkIGtpbmQgJWQgXG4iLAo+PiArICAg
ICAgICAgICAgICAgISEoY3Vyci0+YXJjaC5odm1fdmNwdS5ndWVzdF9jcls0XSAmIFg4Nl9DUjRf
UEFFKSwKPj4gKyAgICAgICAgICAgICAgICEhKGN1cnItPmFyY2guaHZtX3ZjcHUuZ3Vlc3RfZWZl
ciAmIEVGRVJfTlgpLCBnZm4sCj4+ICsgICAgICAgICAgICAgICBwMm1hLCB2aW9sYXRpb24sIG5w
ZmVjLnJlYWRfYWNjZXNzLCBucGZlYy53cml0ZV9hY2Nlc3MsCj4+ICsgICAgICAgICAgICAgICBu
cGZlYy5pbnNuX2ZldGNoLCBucGZlYy5wcmVzZW50LCBucGZlYy5nbGFfdmFsaWQsCj4+IG5wZmVj
LmtpbmQpOwo+PiArCj4+ICAgICAgICAgIGlmICggdmlvbGF0aW9uICkKPj4gICAgICAgICAgewo+
PiAgICAgICAgICAgICAgLyogU2hvdWxkICNWRSBiZSBlbXVsYXRlZCBmb3IgdGhpcyBmYXVsdD8g
Ki8KPj4KPj4gVGhpcyBwYXRjaCBkb2VzIG5vdCByZXF1aXJlIGFueXRoaW5nIGVsc2UsIGp1c3Qg
c3RhcnQgYW4gSFZNIGd1ZXN0IG9uIGFuCj4+IEFNRCBob3N0LiBJdCBvdXRwdXRzIHRoaW5ncyBs
aWtlOgo+Pgo+PiAoWEVOKSBwYWU6IDEsIG54OiAxLCBnZm46IDB4ZjAyMzUgYWNjZXNzIDcgdmlv
bGF0aW9uIDAgcmVhZCAxIHdyaXRlIDEKPj4gaW5zbiAwIHByZXNlbnQgMSBnbGF2IDAga2luZCAy
Cj4+IFsuLi5dCj4+IFdoYXQgYXJlIHdlIG1pc3Npbmc/Cj4gCj4gTG9vayBhdCBwMm0tcHQuYyBh
bmQgY2hlY2sgd2hldGhlciBOWCBpcyBiZWluZyBwcm9wZXJseSBzZXQgaW4gdGhlIE5QVAo+IHRh
YmxlcyB3aGVuIHlvdSBzZWxlY3QgWEVOTUVNX2FjY2Vzc19ydyA/wqAgTlBUIHBhZ2V0YWJsZXMg
aGF2ZSBhbgo+IGlkZW50aWNhbCBmb3JtYXQgYW5kIGxheW91dCB0byByZWd1bGFyIFBBRSBwYWdl
dGFibGVzLgpXZSB3ZXJlbid0IHNldHRpbmcgaXQgYXQgYWxsLiBKdXN0IHN0b3JlZCB0aGUgcmVz
dHJpY3Rpb25zIGluIGEKbmV3bHktYWRkZWQgaW50ZWdlciBpbiBzdHJ1Y3QgcGFnZV9pbmZvIChz
dWdnZXN0aW9ucyBmb3IgdGhlIGJlc3QgcGxhY2UKdG8gc3RvcmUgdGhlbSBhcmUgd2VsY29tZSks
IGFuZCBmZWQgdGhlbSBiYWNrIHRvIHdoYXRldmVyIGZ1bmN0aW9uIHdhcwphc2tpbmcgZm9yIHRo
ZW0gZnJvbSB0aGVyZS4KCkRpZCBhIHF1aWNrIHRlc3QgYW5kIHNldHRpbmcgX1BBR0VfTlhfQklU
IGFzIHdlbGwgc2VlbXMgdG8gYmUgdGhlIHdheSB0bwpnbyBpbmRlZWQuCgoKVGhhbmtzLApSYXp2
YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
