From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] viridian: fix cpuid leaf 0x40000003
Date: Fri, 11 May 2018 20:20:03 +0200
Message-ID: <bdf19693-75a1-6ad1-ca07-2bbdcf4840bb@suse.com>
References: <1526050112-9576-1-git-send-email-paul.durrant@citrix.com>
 <2ce9b3ae-9bc5-801a-b899-3c7aab435b1d@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ul6o=h6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fHCeH-0001X3-2b
 for xen-devel@lists.xenproject.org; Fri, 11 May 2018 18:20:09 +0000
In-Reply-To: <2ce9b3ae-9bc5-801a-b899-3c7aab435b1d@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDUvMTggMTg6MTgsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMTEvMDUvMTggMTU6
NDgsIFBhdWwgRHVycmFudCB3cm90ZToKPj4gVGhlIHJlc3BvbnNlIHRvIHZpcmlkaWFuIGxlYWYg
MyBuZWVkcyB0byBzcGxpdCBhIDY0LWJpdCBtYXNrIGFjcm9zcyBFQVggYW5kCj4+IEVCWCwgd2l0
aCB0aGUgbG93IG9yZGVyIDMyIGJpdHMgaW4gRUFYIGFuZCB0aGUgaGlnaCBvcmRlciAzMiBiaXRz
IGluIEVCWC4KPj4gVG8gZmFjaWxpdGF0ZSB0aGlzIGEgdW5pb24gb2YgdHdvIHVpbnQzMl90IHZh
bHVlcyBhbmQgdGhlIG1hc2sgKHR5cGUKPj4gSFZfUEFSVElUSU9OX1BSSVZJTEVHRV9NQVNLKSBp
cyBhbGxvY2F0ZWQgb24gc3RhY2sgYXMgZm9sbG93czoKPj4KPj4gdW5pb24gewo+PiAgICAgSFZf
UEFSVElUSU9OX1BSSVZJTEVHRV9NQVNLIG1hc2s7Cj4+ICAgICB1aW50MzJfdCBsbywgaGk7Cj4+
IH0gdTsKPj4KPj4gVGhpcywgb2YgY291cnNlLCBpcyBpbmNvcnJlY3QgYXMgYm90aCBsbyBhbmQg
aGkgd2lsbCBhbGlhcyB0aGUgbG93IG9yZGVyCj4+IDMyIGJpdHMgb2YgdGhlIG1hc2suCj4+Cj4+
IFRoaXMgcGF0Y2ggd3JhcHMgbG8gYW5kIGhpIGluIGFuIGFub25teW1vdXMgc3RydWN0IHRvIGFj
aGlldmUgdGhlIGRlc2lyZWQKPj4gZWZmZWN0Lgo+Pgo+PiBOT1RFOiBGaXhpbmcgdGhpcyBhbHNv
IHN0b3BzIFdpbmRvd3MgbWFraW5nIHRoZSBIdkdldFBhcnRpdGlvbklkIGh5cGVyY2FsbAo+PiAg
ICAgICB3aGljaCB3YXMgcHJldmlvdXNseSBjb25zaWRlcmVkIGVycm9uZW91cyBiZWhhdmlvdXIu
IFRodXMgdGhlCj4+ICAgICAgIGh5cGVyY2FsbCBoYW5kbGVyIGlzIGFsc28gbW9kaWZpZWQgdG8g
c3RvcCBzcXVhc2hpbmcgdGhlCj4+ICAgICAgICd1bmltcGxlbWVudGVkJyB3YXJuaW5nIGZvciB0
aGlzIGh5cGVyY2FsbC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1
cnJhbnRAY2l0cml4LmNvbT4KPiAKPiBBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4KPiAKPiBDQyBKdWVyZ2VuLsKgIFRoaXMgd2FudHMgYmFja3BvcnRp
bmcsIGFuZCB0YWtpbmcgaW50byA0LjExCgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
