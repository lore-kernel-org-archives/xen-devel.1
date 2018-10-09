From: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH] KVM: Start populating /sys/hypervisor with
 KVM entries
Date: Tue, 9 Oct 2018 19:50:57 +0200
Message-ID: <20181009195057.2dc8fd7b.cohuck__16945.6447860741$1539107391$gmane$org@redhat.com>
References: <1539078879-4372-1-git-send-email-sironi@amazon.de>
 <c81b65ba-c562-1869-483b-aee5229501e0@de.ibm.com>
 <61740f41-c7e3-edaf-68ac-2e4c4a99523b@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=s3/0=mv=redhat.com=cohuck@srs-us1.protection.inumbo.net>)
 id 1g9w9x-0007HB-9D
 for xen-devel@lists.xenproject.org; Tue, 09 Oct 2018 17:51:05 +0000
In-Reply-To: <61740f41-c7e3-edaf-68ac-2e4c4a99523b@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: kvm@vger.kernel.org, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Filippo Sironi <sironi@amazon.de>, linux-kernel@vger.kernel.org, Christian Borntraeger <borntraeger@de.ibm.com>, xen-devel <xen-devel@lists.xenproject.org>, vasu.srinivasan@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCA5IE9jdCAyMDE4IDEyOjIxOjQ2IC0wNDAwCkJvcmlzIE9zdHJvdnNreSA8Ym9yaXMu
b3N0cm92c2t5QG9yYWNsZS5jb20+IHdyb3RlOgoKPiBPbiAxMC85LzE4IDY6NDEgQU0sIENocmlz
dGlhbiBCb3JudHJhZWdlciB3cm90ZToKPiA+IAo+ID4gCj4gPiBPbiAxMC8wOS8yMDE4IDExOjU0
IEFNLCBGaWxpcHBvIFNpcm9uaSB3cm90ZTogIAo+ID4+IFN0YXJ0IHBvcHVsYXRpbmcgL3N5cy9o
eXBlcnZpc29yIHdpdGggS1ZNIGVudHJpZXMgd2hlbiB3ZSdyZSBydW5uaW5nIG9uCj4gPj4gS1ZN
LiBUaGlzIGlzIHRvIHJlcGxpY2F0ZSBmdW5jdGlvbmFsaXR5IHRoYXQncyBhdmFpbGFibGUgd2hl
biB3ZSdyZQo+ID4+IHJ1bm5pbmcgb24gWGVuLgo+ID4+Cj4gPj4gTGV0J3Mgc3RhcnQgd2l0aCAv
c3lzL2h5cGVydmlzb3IvdXVpZCwgd2hpY2ggdXNlcnMgcHJlZmVyIG92ZXIKPiA+PiAvc3lzL2Rl
dmljZXMvdmlydHVhbC9kbWkvaWQvcHJvZHVjdF91dWlkIGFzIGEgd2F5IHRvIHJlY29nbml6ZSBh
IHZpcnR1YWwKPiA+PiBtYWNoaW5lLCBzaW5jZSBpdCdzIGFsc28gYXZhaWxhYmxlIHdoZW4gcnVu
bmluZyBvbiBYZW4gSFZNIGFuZCBvbiBYZW4gUFYKPiA+PiBhbmQsIG9uIHRvcCBvZiB0aGF0IGRv
ZXNuJ3QgcmVxdWlyZSByb290IHByaXZpbGVnZXMgYnkgZGVmYXVsdC4gIAo+ID4gCj4gPiBDYW4g
eW91IG1ha2UgdGhpcyBhbiBhcmNoIGhvb2s/IE9uIHMzOTAgaXQgaXMgcG9zc2libGUgdG8gZ2V0
IHRoZSB1dWlkIHdpdGgKPiA+IHRoZSBzdHNpIGluc3RydWN0aW9uLiAKPiA+IFNlZQo+ID4gaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL3ZpcnQva3ZtL2t2bS5naXQvdHJlZS9hcmNoL3Mz
OTAva2VybmVsL3N5c2luZm8uYyNuMjQ4Cj4gPiAKPiA+IAo+ID4gV2UgZG8gdXNlIHV1aWRfdCwg
YnV0IHdlIGNhbiBjZXJ0YWlubHkgcmV0dXJuIGEgY2hhciouICAKPiAKPiAKPiBJIHdvdWxkIHN1
Z2dlc3QgaGF2aW5nIGEgdG9wLWxldmVsIHN5cy1oeXBlcnZpc29yLmMgdGhhdCB3aWxsIGNyZWF0
ZQo+IGNvbW1vbiBmaWxlcyB0aGF0IGFsbCBoeXBlcnZpc29ycyBzaG91bGQgaGF2ZSAodXVpZCwg
dHlwZSwgdmVyc2lvbiwgZXRjKQo+IGFuZCB0aGVuIGhhdmUgaHlwZXJ2aXNvci0gYW5kL29yIGFy
Y2gtc3BlY2lmaWMgaG9va3MuCgpJIHRoaW5rIHdlIHJlYWxseSBuZWVkICpib3RoKiBoeXBlcnZp
c29yLSBhbmQgYXJjaC1zcGVjaWZpYyBob29rcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
