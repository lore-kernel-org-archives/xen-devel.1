From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 22/23] xen/arm: move kernel.h to asm-arm/
Date: Wed, 17 Oct 2018 17:26:11 +0100
Message-ID: <ed8829be-4b24-02f1-bf7c-fe57de0d485e@citrix.com>
References: <alpine.DEB.2.10.1810051140030.24936@sstabellini-ThinkPad-X260>
 <1538765251-25256-22-git-send-email-sstabellini@kernel.org>
 <3410d002-8c94-f7f3-7c57-d2ffd53ef676@arm.com>
 <alpine.DEB.2.10.1810172242050.3835@sstabellini-ThinkPad-X260>
 <52b8cd47-2d04-f561-c684-f343f6982bc3@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pwmr=m5=citrix.com=prvs=821ff731b=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gCoeE-0000Bj-MR
 for xen-devel@lists.xenproject.org; Wed, 17 Oct 2018 16:26:14 +0000
In-Reply-To: <52b8cd47-2d04-f561-c684-f343f6982bc3@arm.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMTcvMTAvMTggMTc6MTEsIEp1bGllbiBHcmFsbCB3cm90ZToKPgo+Cj4gT24gMTcvMTAvMjAx
OCAxNTo0MiwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+PiBPbiBNb24sIDE1IE9jdCAyMDE4
LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBIaSBTdGVmYW5vLAo+Pj4KPj4+IE9uIDA1LzEwLzIw
MTggMTk6NDcsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+PiBJdCB3aWxsIGJlICNpbmNs
dWRlZCBieSBhIGZpbGUgaW4gYSB4ZW4vYXJjaC9hcm0gc3ViZGlyZWN0b3J5Lgo+Pj4+Cj4+Pj4g
U2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgo+
Pj4+IC0tLQo+Pj4+IMKgwqAgeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jwqAgfMKgIDIgKy0K
Pj4+PiDCoMKgIHhlbi9hcmNoL2FybS9rZXJuZWwuY8KgwqDCoMKgwqDCoMKgIHzCoCAzICstCj4+
Pj4gwqDCoCB4ZW4vYXJjaC9hcm0va2VybmVsLmjCoMKgwqDCoMKgwqDCoCB8IDg2Cj4+Pj4gLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+PiDCoMKgIHhlbi9p
bmNsdWRlL2FzbS1hcm0va2VybmVsLmggfCA4Ngo+Pj4+ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCj4+Pgo+Pj4gVGhlcmUgYXJlIHdheSB0byBtYWtlIGdpdCBk
aWZmIG5pY2VyIGZvciBjb2RlIG1vdmVtZW50LiBUaGlzIHNlZW1zCj4+PiB0byBiZSBkb25lCj4+
PiBieSBkZWZhdWx0IG9uIDIuMTEuMC4gTm90IHN1cmUgZm9yIG9sZGVyIHZlcnNpb24uIFdoYXQg
YXJlIHlvdSB1c2luZz8KPj4KPj4gR2l0IHZlcnNpb24gMS45LjEgKGFuZCBndWlsdCAwLjM1KQo+
Cj4gQSA0IHllYXJzIG9sZCBnaXQgdmVyc2lvbi4gTWF5IEkgYXNrIHRvIHVwZGF0ZSB0byBhIG5l
dyBnaXQgKG9yIHNlZSBpZgo+IHRoZXJlIGFyZSBhbiBvcHRpb24gZG9pbmcgdGhlIHNhbWUpPyBU
aGlzIHdvdWxkIGhlbHAgcmV2aWV3aW5nIGNvZGUKPiBtb3ZlbWVudC4KCmdpdCBjb25maWcgLS1n
bG9iYWwgZGlmZi5yZW5hbWVzPWNvcHkKCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
