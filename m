From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 2/2] KVM: x86: Implement the
 arch-specific hook to report the VM UUID
Date: Thu, 16 May 2019 12:40:46 -0400
Message-ID: <3a9762a2-24e8-a842-862d-fadae563361d__17435.5766082712$1558024960$gmane$org@oracle.com>
References: <1539078879-4372-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-3-git-send-email-sironi@amazon.de>
 <f51a6a84-b21c-ab75-7e30-bfbe2ac6b98b@amazon.com>
 <7395EFE9-0B38-4B61-81D4-E8450561AABE@amazon.de>
 <8c6a2de2-f080-aad5-16af-c4a5eafb31af@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qiPN=TQ=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1hRJRg-0002YK-W3
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 16:41:29 +0000
In-Reply-To: <8c6a2de2-f080-aad5-16af-c4a5eafb31af@amazon.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexander Graf <graf@amazon.com>, "Sironi, Filippo" <sironi@amazon.de>
Cc: KVM list <kvm@vger.kernel.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, "cohuck@redhat.com" <cohuck@redhat.com>, LKML <linux-kernel@vger.kernel.org>, Christian Borntraeger <borntraeger@de.ibm.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "vasu.srinivasan@oracle.com" <vasu.srinivasan@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gNS8xNi8xOSAxMTozMyBBTSwgQWxleGFuZGVyIEdyYWYgd3JvdGU6Cj4gT24gMTYuMDUuMTkg
MDg6MjUsIFNpcm9uaSwgRmlsaXBwbyB3cm90ZToKPj4+IE9uIDE2LiBNYXkgMjAxOSwgYXQgMTU6
NTYsIEdyYWYsIEFsZXhhbmRlciA8Z3JhZkBhbWF6b24uY29tPiB3cm90ZToKPj4+Cj4+PiBPbiAx
NC4wNS4xOSAwODoxNiwgRmlsaXBwbyBTaXJvbmkgd3JvdGU6Cj4+Pj4gT24geDg2LCB3ZSByZXBv
cnQgdGhlIFVVSUQgaW4gRE1JIFN5c3RlbSBJbmZvcm1hdGlvbiAoaS5lLiwgRE1JIFR5cGUgMSkK
Pj4+PiBhcyBWTSBVVUlELgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogRmlsaXBwbyBTaXJvbmkg
PHNpcm9uaUBhbWF6b24uZGU+Cj4+Pj4gLS0tCj4+Pj4gYXJjaC94ODYva2VybmVsL2t2bS5jIHwg
NyArKysrKysrCj4+Pj4gMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+Pj4+Cj4+Pj4g
ZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC9rdm0uYyBiL2FyY2gveDg2L2tlcm5lbC9rdm0u
Ywo+Pj4+IGluZGV4IDVjOTNhNjVlZTFlNS4uNDQxY2FiMDhhMDlkIDEwMDY0NAo+Pj4+IC0tLSBh
L2FyY2gveDg2L2tlcm5lbC9rdm0uYwo+Pj4+ICsrKyBiL2FyY2gveDg2L2tlcm5lbC9rdm0uYwo+
Pj4+IEBAIC0yNSw2ICsyNSw3IEBACj4+Pj4gI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+Pj4+
ICNpbmNsdWRlIDxsaW51eC9rdm1fcGFyYS5oPgo+Pj4+ICNpbmNsdWRlIDxsaW51eC9jcHUuaD4K
Pj4+PiArI2luY2x1ZGUgPGxpbnV4L2RtaS5oPgo+Pj4+ICNpbmNsdWRlIDxsaW51eC9tbS5oPgo+
Pj4+ICNpbmNsdWRlIDxsaW51eC9oaWdobWVtLmg+Cj4+Pj4gI2luY2x1ZGUgPGxpbnV4L2hhcmRp
cnEuaD4KPj4+PiBAQCAtNjk0LDYgKzY5NSwxMiBAQCBib29sIGt2bV9wYXJhX2F2YWlsYWJsZSh2
b2lkKQo+Pj4+IH0KPj4+PiBFWFBPUlRfU1lNQk9MX0dQTChrdm1fcGFyYV9hdmFpbGFibGUpOwo+
Pj4+Cj4+Pj4gK2NvbnN0IGNoYXIgKmt2bV9wYXJhX2dldF91dWlkKHZvaWQpCj4+Pj4gK3sKPj4+
PiArCXJldHVybiBkbWlfZ2V0X3N5c3RlbV9pbmZvKERNSV9QUk9EVUNUX1VVSUQpOwo+Pj4gVGhp
cyBhZGRzIGEgbmV3IGRlcGVuZGVuY3kgb24gQ09ORklHX0RNSS4gUHJvYmFibHkgYmVzdCB0byBn
dWFyZCBpdCB3aXRoCj4+PiBhbiAjaWYgSVNfRU5BQkxFRChDT05GSUdfRE1JKS4KPj4+Cj4+PiBU
aGUgY29uY2VwdCBzZWVtcyBzb3VuZCB0aG91Z2guCj4+Pgo+Pj4gQWxleAo+PiBpbmNsdWRlL2xp
bnV4L2RtaS5oIGNvbnRhaW5zIGEgZHVtbXkgaW1wbGVtZW50YXRpb24gb2YKPj4gZG1pX2dldF9z
eXN0ZW1faW5mbyB0aGF0IHJldHVybnMgTlVMTCBpZiBDT05GSUdfRE1JIGlzbid0IGRlZmluZWQu
Cj4KPiBPaCwgSSBtaXNzZWQgdGhhdCBiaXQuIEF3ZXNvbWUhIExlc3Mgd29yayA6KS4KPgo+Cj4+
IFRoaXMgaXMgZW5vdWdoIHVubGVzcyB3ZSBkZWNpZGUgdG8gcmV0dXJuICI8ZGVuaWVkPiIgbGlr
ZSBpbiBYZW4uCj4+IElmIHRoZW4sIHdlIGNhbiBoYXZlIHRoZSBjaGVjayBpbiB0aGUgZ2VuZXJp
YyBjb2RlIHRvIHR1cm4gTlVMTAo+PiBpbnRvICI8ZGVuaWVkPiIuCj4KPiBZZXMuIFdhaXRpbmcg
Zm9yIHNvbWVvbmUgZnJvbSBYZW4gdG8gYW5zd2VyIHRoaXMgOikKCk5vdCBzdXJlIEkgYW0gYW5z
d2VyaW5nIHlvdXIgcXVlc3Rpb24gYnV0IG9uIFhlbiB3ZSByZXR1cm4gVVVJRCB2YWx1ZQp6ZXJv
IGlmIGFjY2VzcyBwZXJtaXNzaW9ucyBhcmUgbm90IHN1ZmZpY2llbnQuIE5vdCA8ZGVuaWVkPi4K
Cmh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1ibG9iO2Y9eGVuL2Nv
bW1vbi9rZXJuZWwuYztoPTYxMjU3NTQzMGYxY2U3ZmFmNWJkNjZlN2E5OWYxNzU4YzYzZmIzY2I7
aGI9SEVBRCNsNTA2CgotYm9yaXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
