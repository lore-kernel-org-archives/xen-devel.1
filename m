From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4] x86: use VMLOAD for PV context switch
Date: Thu, 04 Oct 2018 06:27:45 -0600
Message-ID: <5BB6074102000078001EE52A@prv1-mh.provo.novell.com>
References: <5BAB385102000078001EBFD9@prv1-mh.provo.novell.com>
 <3add91b0-5743-97e9-1b4f-d8fd15a47c05@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=z6fo=mq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g82jN-0004w5-Pi
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 12:27:49 +0000
In-Reply-To: <3add91b0-5743-97e9-1b4f-d8fd15a47c05@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjEwLjE4IGF0IDEzOjU4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjYvMDkvMTggMDg6NDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBAQCAtMTYzMCw2
ICsxNjQ2LDY2IEBAIHN0YXRpYyB2b2lkIHN2bV9pbml0X2VycmF0dW1fMzgzKGNvbnN0IHMKPj4g
ICAgICB9Cj4+ICB9Cj4+ICAKPj4gKyNpZmRlZiBDT05GSUdfUFYKPj4gK2Jvb2wgc3ZtX2xvYWRf
c2Vncyh1bnNpZ25lZCBpbnQgbGR0X2VudHMsIHVuc2lnbmVkIGxvbmcgbGR0X2Jhc2UsCj4+ICsg
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGZzX3NlbCwgdW5zaWduZWQgbG9uZyBmc19i
YXNlLAo+PiArICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBnc19zZWwsIHVuc2lnbmVk
IGxvbmcgZ3NfYmFzZSwKPj4gKyAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGdzX3No
YWRvdykKPj4gK3sKPj4gKyAgICB1bnNpZ25lZCBpbnQgY3B1ID0gc21wX3Byb2Nlc3Nvcl9pZCgp
Owo+PiArICAgIHN0cnVjdCB2bWNiX3N0cnVjdCAqdm1jYiA9IHBlcl9jcHUoaG9zdF92bWNiX3Zh
LCBjcHUpOwo+PiArCj4+ICsgICAgaWYgKCB1bmxpa2VseSghdm1jYikgKQo+PiArICAgICAgICBy
ZXR1cm4gZmFsc2U7Cj4+ICsKPj4gKyAgICBpZiAoICFsZHRfYmFzZSApCj4+ICsgICAgewo+PiAr
ICAgICAgICAvKgo+PiArICAgICAgICAgKiBUaGUgYWN0dWFsIHN0cnVjdHVyZSBmaWVsZCB1c2Vk
IGhlcmUgd2FzIGFyYml0cmFyaWx5IGNob3Nlbi4KPj4gKyAgICAgICAgICogRW1waXJpY2FsbHkg
aXQgZG9lc24ndCBzZWVtIHRvIG1hdHRlciBtdWNoIHdoaWNoIGVsZW1lbnQgaXMgdXNlZCwKPj4g
KyAgICAgICAgICogYW5kIGEgY2xlYXIgZXhwbGFuYXRpb24gb2YgdGhlIG90aGVyd2lzZSBwb29y
IHBlcmZvcm1hbmNlIGhhcyBub3QKPj4gKyAgICAgICAgICogYmVlbiBmb3VuZC9wcm92aWRlZCBz
byBmYXIuCj4+ICsgICAgICAgICAqLwo+PiArICAgICAgICBhc20gdm9sYXRpbGUgKCAicHJlZmV0
Y2ggJTAiIDo6ICJtIiAodm1jYi0+bGR0cikgKTsKPiAKPiBwcmVmZXRjaHcoKS4KClllYWgsIEkg
aGF2ZSBjaGFuZ2VkIHRoaXMgYWxyZWFkeSBpbiB3aGF0IHdpbGwgKHdvdWxkKSBiZWNvbWUgdjUs
CmFsb25nIHdpdGggdGhlIG9wdGltaXphdGlvbiBjb25kaXRpb24geW91IGhhZCBwb2ludGVkIG91
dCBpcyBub3QKaW4gbGluZSB3aXRoIHRoZSBjb21tZW50IG5leHQgdG8gaXQuCgo+IE90aGVyd2lz
ZSwgUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
CgpUaGFua3MuIEkgZ3Vlc3MgSSdsbCBwb3N0IHY1IGFuZCBnaXZlIGl0IGEgZGF5IGJlZm9yZSBj
b21taXR0aW5nLApqdXN0IGluIGNhc2UuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
