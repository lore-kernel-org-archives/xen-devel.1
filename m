From: Julien Grall <julien.grall@arm.com>
Subject: Re: arm: xl vcpu-pin leads to oom-killer slashing
 processes
Date: Wed, 5 Dec 2018 12:15:51 +0000
Message-ID: <ee45a5c4-5097-a0e6-8099-f0a998cc3c88@arm.com>
References: <2c2385f9-515d-1c13-2618-d22d52901abc@gmail.com>
 <cfad156f-19ef-5e87-7af0-3dbbf361dc8a@arm.com>
 <9f2f6edf-c96d-fda9-851b-a2bae8fb25ec@gmail.com>
 <6bc804b4-df7a-08fd-9bf0-7384015a2b74@arm.com>
 <5f581369-55ad-345f-7837-48265fcd805a@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aGku=OO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gUW5r-0008Gp-H1
 for xen-devel@lists.xenproject.org; Wed, 05 Dec 2018 12:15:55 +0000
In-Reply-To: <5f581369-55ad-345f-7837-48265fcd805a@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwNS8xMi8yMDE4IDExOjU5LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IAo+IE9uIDA1LjEy
LjE4IDEzOjQ1LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IFdlbGwsIGF0IGxlYXN0IHRoZSBrZXJu
ZWwgdGhpbmtzIGl0IGRvZXMgbm90IGhhdmUgYW55bW9yZSBtZW1vcnkgKHNlZSB0aGUgY2FsbCAK
Pj4gdHJhY2UpLgo+IFllcywgaXQgdGhpbmtzIHNvLiBCdXQgaXQgaXMgbm90IGxpbmtlZCB0byBk
b21haW4gLgoKV2hhdCBkbyB5b3UgbWVhbj8gQSBtZW1vcnkgY29ycnVwdGlvbiBieSBYZW4gaXMg
ZXh0cmVtZWx5IHVubGlrZWx5LiBTbyBpdCBsb29rcyAKbGlrZSB0byBtZSB0aGlzIGlzIGEgcmVs
YXRlZCB0byB5b3VyIGRvbWFpbiAoa2VybmVsIG9yIHVzZXJzcGFjZSksIHBvc3NpYmx5IApiZWNh
dXNlIG1lbW9yeSBoYXMgbm90IGJlZW4gZnJlZWQgY29ycmVjdGx5LgoKPiAKPj4gV2hhdCBkbyB5
b3UgbWVhbiBieSBhbGwgeW91ciByb3V0aW5lPwo+IEkgbWVhbiBhbGwgdGhpbmdzIEknbSBwbGF5
aW5nIHdpdGggbm93LiBSdW5uaW5nIHRibSBiYXJlbWV0YWwgYXBwIGluIGRpZmZlcmVudCAKPiB1
c2UtY2FzZXMsIGJyaW5naW5nIGl0IHVwIHdpdGggbmV3IHZnaWMuCj4gCj4+IEhvdyBtdWNoIHdv
cmsgZGlkIHlvdSBkbyBvbiB0aGUgcGxhdGZvcm0gYmVmb3JlIHRyaWdnZXJpbmcgb2VtLWtpbGxl
cj8KPiBXaXRob3V0IGNwdSBwaW5uaW5nIEkgZG8gYWxsIEkgbmVlZCB3aXRob3V0IG9vbS1raWxs
ZXIgYmVpbmcgdHJpZ2dlcmVkLgo+IEFmdGVyIGNwdSBwaW5uaW5nIGl0IHRha2VzIDUtMTAgc2Vj
b25kcyB1bnRpbCBvb20ta2lsbGVyIHN0YXJ0cyB0byBraWxsIGV2ZXJ5dGhpbmcuCgpCZWxvdyBh
IGxpc3Qgb2YgcXVlc3Rpb25zIHRvIGFuc3dlcjoKCS0gQ2FuIHlvdSBnaXZlIHRoZSBzdGVwcyB0
byByZXByb2R1Y2UgaXQgZnJvbSBib290PwoJLSBIb3cgbXVjaCBtZW1vcnkgbGVmdCBkbyB5b3Ug
aGF2ZSBiZWZvcmUgY2FsbGluZyB4bCB2Y3B1LXBpbj8KCS0gV2hlbiBleGFjdGx5IGRvIHlvdSBw
aW4gdGhlIHZDUFVzPyAoaS5lIGhvdyBsb25nIGFmdGVyIGJvb3QpCgktIFdoYXQgYXJlIHRoZSBv
dGhlciBwcm9ncmFtcyBydW5uaW5nPyBIb3cgbXVjaCBtZW1vcnkgYXJlIHRoZXkgdXNpbmc/CgpD
aGVlcnMsCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
