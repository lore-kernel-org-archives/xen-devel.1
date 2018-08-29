From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 1/2] x86: report use of PCID together
 with reporting XPTI status
Date: Wed, 29 Aug 2018 14:58:32 +0100
Message-ID: <24aa1354-657b-094f-e16b-6828af972dd9@citrix.com>
References: <5B4EF9C402000078001D5433@prv1-mh.provo.novell.com>
 <5B766F0202000078001DF30A@prv1-mh.provo.novell.com>
 <5B76737B02000078001DF33F@prv1-mh.provo.novell.com>
 <2b91f320-e0ef-1919-087b-93d69def1635@citrix.com>
 <5B86974402000078001E307C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xzde=lm=citrix.com=prvs=772b5abf7=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fv11M-0003Zb-Hs
 for xen-devel@lists.xenproject.org; Wed, 29 Aug 2018 14:00:32 +0000
In-Reply-To: <5B86974402000078001E307C@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMDgvMTggMTM6NTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDI5LjA4LjE4IGF0
IDE0OjQxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDE3LzA4LzE4
IDA4OjA0LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYv
cHYvZG9tYWluLmgKPj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvcHYvZG9tYWluLmgKPj4+
IEBAIC0yMSw2ICsyMSw4IEBACj4+PiAgI2lmbmRlZiBfX1g4Nl9QVl9ET01BSU5fSF9fCj4+PiAg
I2RlZmluZSBfX1g4Nl9QVl9ET01BSU5fSF9fCj4+PiAgCj4+PiArI2luY2x1ZGUgPHhlbi9zY2hl
ZC5oPgo+PiBKdXN0IHR5cGVzPyAgSXRzIGFsbCB5b3UgbmVlZC4KPiBUaGF0J3MgYWxsIEkgbmVl
ZCBmb3IgbXkgYWRkaXRpb24sIGJ1dCBwcmlvciB0byB0aGlzIHRoZSBoZWFkZXIgd2Fzbid0Cj4g
dXNhYmxlIHdpdGhvdXQgZmlyc3QgaGF2aW5nIGluY2x1ZGVkIHNvbWUgb3RoZXIgaGVhZGVycy4K
PiBnZXRfcGNpZF9iaXRzKCkgZGUtcmVmZXJlbmNlcyBzdHJ1Y3QgdmNwdSwgc28gc2NoZWQuaCBf
aXNfIG5lZWRlZAo+IChhbmQgc2hvdWxkIGhhdmUgYmVlbiB0aGVyZSBiZWZvcmUpLgoKT2suwqAg
QWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
