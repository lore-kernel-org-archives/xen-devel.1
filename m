From: Jordan Justen <jordan.l.justen@intel.com>
Subject: Re: [edk2-devel] [PATCH v2 02/31] OvmfPkg: Create
 platform XenOvmf
Date: Wed, 10 Apr 2019 02:48:28 -0700
Message-ID: <155488970861.20447.12525571872411959890@jljusten-skl>
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-3-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sbnS=SM=intel.com=jordan.l.justen@srs-us1.protection.inumbo.net>)
 id 1hE9qK-0005L0-43
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 09:48:32 +0000
In-Reply-To: <20190409110844.14746-3-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: devel@edk2.groups.io
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, Laszlo Ersek <lersek@redhat.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOS0wNC0wOSAwNDowODoxNSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gVGhpcyBpcyBh
IGNvcHkgb2YgT3ZtZlg2NCwgcmVtb3ZpbmcgVmlydElPIGFuZCBzb21lIFNNTS4KPiAKPiBUaGlz
IG5ldyBwbGF0Zm9ybSB3aWxsIGJlIGNoYW5nZWQgdG8gbWFrZSBpdCB3b3JrcyBvbiB0d28gdHlw
ZXMgb2YgWGVuCj4gZ3Vlc3Q6IEhWTSBhbmQgUFZILgo+IAo+IENvbXBhcmUgdG8gT3ZtZlg2NCwg
dGhpcyBwYXRjaDoKPiAKPiAtIGNoYW5nZWQ6IFBMQVRGT1JNX0dVSUQsIE9VVFBVVF9ESVJFQ1RP
UlksIEZMQVNIX0RFRklOSVRJT04KPiAtIHJlbW92ZWQ6IFZpcnRpb0xpYiBjbGFzcyByZXNvbHV0
aW9uCj4gLSByZW1vdmVkOiBhbGwgVUVGSV9EUklWRVIgbW9kdWxlcyBmb3IgdmlydGlvIGRldmlj
ZXMKPiAtIHJlbW92ZWQ6IERYRV9TTU1fRFJJVkVSIGFuZCBTTU1fQ09SRSBsaWIgY2xhc3MgcmVz
b2x1dGlvbnMKPiAtIHJlbW92ZWQ6IERYRV9TTU1fRFJJVkVSIGFuZCBTTU1fQ09SRSBGREYgcnVs
ZXMKPiAtIHJlbW92ZWQ6IEV2ZXJ5dGhpbmcgcmVsYXRlZCB0byBTTU1fUkVRVUlSRT09dHJ1ZQo+
IC0gcmVtb3ZlZDogRXZlcnl0aGluZyByZWxhdGVkIHRvIFNFQ1VSRV9CT09UX0VOQUJMRT09dHJ1
ZQo+IC0gcmVtb3ZlZDogRXZlcnl0aGluZyByZWxhdGVkIHRvIFRQTTJfRU5BQkxFPT10cnVlCj4g
LSBjaGFuZ2VkOiBQY2RQY2lEaXNhYmxlQnVzRW51bWVyYXRpb24gZHluYW1pYyBkZWZhdWx0IGZs
aXBwZWQgdG8gVFJVRQo+IC0gY2hhbmdlZDogZGVmYXVsdCBGRF9TSVpFX0lOX0tCIHRvIDJNLgo+
IAo+IENvbnRyaWJ1dGVkLXVuZGVyOiBUaWFub0NvcmUgQ29udHJpYnV0aW9uIEFncmVlbWVudCAx
LjEKPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4
LmNvbT4KPiAtLS0KPiAgT3ZtZlBrZy97T3ZtZlBrZ1g2NC5kc2MgPT4gWGVuT3ZtZi5kc2N9ICAg
ICB8IDIwMiArLS0tLS0tLS0tLS0tLS0tLS0tLQoKSSBndWVzcyB3ZSBhbGwgd2FudCBvdXIgbmFt
ZSB0byBiZSBmaXJzdCA6KSwgYnV0IE92bWZYZW4gc2VlbXMgbW9yZQpsaWtlIHRoZSBwYXR0ZXJu
IHRoYXQgZWRrMiB1c2VzIHdoZW4gbWFraW5nIHN1Yi1wbGF0Zm9ybXMuCgpBbHNvLCBpbiBzb21l
IGNhc2VzIHdlJ3ZlIHVzZWQgIWlmZGVmIHR5cGUgdGhpbmdzIHRvIGtlZXAgZHNjIGFuZCBmZGYK
ZmlsZXMgY29tbW9uLiBXb3VsZCB0aGF0IG5vdCBiZSB3b3JrYWJsZSBoZXJlPyBNYXliZSBpdCB3
b3VsZCBnZXQgdG9vCnVnbHkuIDpcCgpJdCBjb3VsZCBoZWxwIHRvIHByZXZlbnQgaGF2aW5nIHRv
IHN5bmMgZHNjIGNoYW5nZXMgYWNyb3NzLCBhbmQKcHJldmVudCBjaGFuZ2VzIGZyb20gYmVpbmcg
b21pdHRlZCBmb3IgWGVuIG9uIGFjY2lkZW50LgoKLUpvcmRhbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
