From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH for-4.12] x86/altp2m: fix
 HVMOP_altp2m_set_domain_state race
Date: Fri, 8 Feb 2019 13:13:41 +0200
Message-ID: <4618b7c6-0fea-e33b-1218-731d8b3124a5@bitdefender.com>
References: <1549619775-4129-1-git-send-email-rcojocaru@bitdefender.com>
 <5C5D5F450200007800214FDD@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5uHS=QP=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gs46N-0001Go-Fs
 for xen-devel@lists.xenproject.org; Fri, 08 Feb 2019 11:13:47 +0000
In-Reply-To: <5C5D5F450200007800214FDD@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMi84LzE5IDEyOjUxIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAwOC4wMi4xOSBh
dCAxMDo1NiwgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+PiBIVk1PUF9hbHRw
Mm1fc2V0X2RvbWFpbl9zdGF0ZSBkb2VzIG5vdCBkb21haW5fcGF1c2UoKSwgcHJlc3VtYWJseQo+
PiBvbiBwdXJwb3NlIChhcyBpdCB3YXMgb3JpZ2luYWxseSBzdXBwb3NlZCB0byBjYXRlciB0byBh
IGluLWd1ZXN0Cj4+IGFnZW50LCBhbmQgYSBkb21haW4gcGF1c2luZyBpdHNlbGYgaXMgbm90IGEg
Z29vZCBpZGVhKS4KPj4KPj4gVGhpcyBjYW4gbGVhZCB0byBkb21haW4gY3Jhc2hlcyBpbiB0aGUg
dm14X3ZtZXhpdF9oYW5kbGVyKCkgY29kZQo+PiB0aGF0IGNoZWNrcyBpZiB0aGUgZ3Vlc3QgaGFz
IHRoZSBhYmlsaXR5IHRvIHN3aXRjaCBFUFRQIHdpdGhvdXQgYW4KPj4gZXhpdC4gVGhhdCBjb2Rl
IGNhbiBfX3ZtcmVhZCgpIHRoZSBob3N0IHAybSdzIEVQVF9QT0lOVEVSCj4+IChiZWZvcmUgSFZN
T1BfYWx0cDJtX3NldF9kb21haW5fc3RhdGUgImZvcl9lYWNoX3ZjcHUoKSIgaGFzIGEKPj4gY2hh
bmNlIHRvIHJ1biBhbHRwMm1fdmNwdV9pbml0aWFsaXNlKCksIGJ1dCBhZnRlcgo+PiBkLT5hcmNo
LmFsdHAybV9hY3RpdmUgaXMgc2V0KS4KPj4KPj4gV2hpbGUgdGhlIGluLWd1ZXN0IHNjZW5hcmlv
IGNvbnRpbnVlcyB0byBwb3NlIHByb2JsZW1zLCB0aGlzCj4+IHBhdGNoIGZpeGVzIHRoZSAiZXh0
ZXJuYWwiIGNhc2UuCj4gCj4gSU9XIHlvdSdyZSBwYXBlcmluZyBvdmVyIHRoZSBwcm9ibGVtIHJh
dGhlciB0aGFuIGZpeGluZyBpdC4gV2h5Cj4gZG9lcyBhbHRwMm1fYWN0aXZlIGdldCBzZXQgdG8g
dHJ1ZSBiZWZvcmUgYWN0dWFsbHkgaGF2aW5nIHNldCB1cAo+IGV2ZXJ5dGhpbmc/IFNob3VsZG4n
dCBpdCBnZXQgY2xlYXJlZCBlYXJseSwgYnV0IHNldCBsYXRlPwpXZWxsLCB5ZXMsIHRoYXQgd291
bGQgaGF2ZSBiZWVuIG15IHNlY29uZCBhdHRlbXB0OiBzZXQgdGhlICJhbHRwMm0gCmVuYWJsZWQi
IGJvb2wgYWZ0ZXIgdGhlIGluaXQsIGFuZCBiZWZvcmUgdGhlIHVuaW5pdCBhbmQgbm8gbG9uZ2Vy
IApkb21haW5fcGF1c2UoKSBleHBsaWNpdGx5OyBob3dldmVyIEkgdGhvdWdodCB0aGF0IHdhcyBh
IGJyaXR0bGUgCnNvbHV0aW9uLCByZWx5aW5nIG9uIGNvbW1lbnRzIC8gcHJvZ3JhbW1lciBhdHRl
bnRpb24gdG8gdGhlIGNvZGUgCnNlcXVlbmNlIHJhdGhlciB0aGFuIHRha2luZyBhIHByb3BlciBs
b2NrLgoKSSdsbCB0ZXN0IHRoYXQgc2NlbmFyaW8gdGhlbiBhbmQgcmV0dXJuIHdpdGggdGhlIHJl
c3VsdHMgLyBwb3NzaWJseSAKYW5vdGhlciBwYXRjaC4KCgpUaGFua3MsClJhenZhbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
