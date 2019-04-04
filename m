From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/3] x86/sysctl: Clean up
 XEN_SYSCTL_cpu_hotplug
Date: Thu, 4 Apr 2019 14:31:18 +0100
Message-ID: <7c6bf7b6-3b4a-6b9d-6fe4-694f9d595025@citrix.com>
References: <1554235048-3373-1-git-send-email-andrew.cooper3@citrix.com>
 <1554235048-3373-3-git-send-email-andrew.cooper3@citrix.com>
 <5CA474A5020000780022428C@prv1-mh.provo.novell.com>
 <096706af-4199-b028-caf5-9c4a73ed4228@citrix.com>
 <5CA47EFD02000078002242E6@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5CA47EFD02000078002242E6@prv1-mh.provo.novell.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMDQvMjAxOSAxMDozOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDMuMDQuMTkg
YXQgMTE6MDYsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMDMvMDQv
MjAxOSAwOTo1MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAwMi4wNC4xOSBhdCAyMTo1
NywgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9zeXNjdGwuYwo+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9zeXNjdGwuYwo+Pj4+IEBAIC0x
MzcsMjcgKzEzNywzNSBAQCBsb25nIGFyY2hfZG9fc3lzY3RsKAo+Pj4+ICAgICAgY2FzZSBYRU5f
U1lTQ1RMX2NwdV9ob3RwbHVnOgo+Pj4+ICAgICAgewo+Pj4+ICAgICAgICAgIHVuc2lnbmVkIGlu
dCBjcHUgPSBzeXNjdGwtPnUuY3B1X2hvdHBsdWcuY3B1Owo+Pj4+ICsgICAgICAgIGJvb2wgcGx1
ZzsKPj4+PiArICAgICAgICBsb25nICgqZm4pKHZvaWQgKikgPSBOVUxMOwo+Pj4+ICsgICAgICAg
IHZvaWQgKmhjcHUgPSBOVUxMOwo+Pj4gTWF5IEkgYXNrIHRoYXQgeW91IGNvbnNpc3RlbnRseSBp
bml0aWFsaXplIChvciBub3QpIGFsbCB0aHJlZSBuZXcKPj4+IHZhcmlhYmxlcyB5b3UgaW50cm9k
dWNlPwo+PiBJIG5vdGljZWQgdGhpcyB3aGlsZSBwb3N0aW5nLiAgTm90IHdvdWxkIGFsbG93IHRo
ZSBjb21waWxlciB0byBub3RpY2UKPj4gd2hlbiBmbiB3YXNuJ3Qgc2VsZWN0ZWQsIGJ1dCBodmNw
dSBpcyBnb2luZyB0byBlbmQgdXAgd2l0aCBhbgo+PiBpbml0aWFsaXNlciBieSB0aGUgbmV4dCBw
YXRjaC4KPiBSaWdodCwgSSd2ZSBub3RpY2VkIHRoZSBuZWVkIGZvciBoY3B1IHRvIHN0YXkgYXMg
aXMgd2hpbGUgbG9va2luZyBhdAo+IHBhdGNoIDMuIEJlZm9yZSB5b3UgcmVtb3ZlIHRoZSBvdGhl
ciBpbml0aWFsaXplciwgdGhvdWdoIC0gYXJlIHlvdQo+IHN1cmUgeW91IGRvbid0IG5lZWQgdG8g
aW5zdGVhZCBhZGQgb25lLCBmb3Igb2xkZXIgZ2NjIHRvIG5vdCBjaG9rZT8KCkNJIGlzIGhhcHB5
CgpodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QvcGVvcGxlL2FuZHloaHAveGVuL3BpcGVs
aW5lcy81NTIxMTkyNgoKKFRoaXMgaXMgc3BlY2lmaWNhbGx5IHdoeSBJIGFkZGVkIHRoZSBDZW50
T1MgNiBidWlsZCkKCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
