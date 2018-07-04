From: Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [PATCH v2 8/8] efi: drop original xen.efi code and
 build mechanism
Date: Wed, 4 Jul 2018 16:25:05 +0200
Message-ID: <20180704142505.GB26572@olila.local.net-space.pl>
References: <1529418946-30114-1-git-send-email-daniel.kiper@oracle.com>
 <1529418946-30114-9-git-send-email-daniel.kiper@oracle.com>
 <5B34E7F802000078001CEE2F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=z+bn=ju=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1faiij-0001fY-W5
 for xen-devel@lists.xenproject.org; Wed, 04 Jul 2018 14:25:26 +0000
Content-Disposition: inline
In-Reply-To: <5B34E7F802000078001CEE2F@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas.k.lengyel@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKdW4gMjgsIDIwMTggYXQgMDc6NTE6NTJBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE5LjA2LjE4IGF0IDE2OjM1LCA8ZGFuaWVsLmtpcGVyQG9yYWNsZS5jb20+
IHdyb3RlOgo+ID4gVGhlbiByZW5hbWUgeGVuLm1iLmVmaSB0byB4ZW4uZWZpIGFuZCBkcm9wIGFs
bCByZWxhdGVkCj4gPiBkaWZmZXJlbnRpYXRvcnMgaW4gdGhlIGNvZGUuCj4KPiBGb3IgdGhpcyB5
b3UnbGwgZmlyc3Qgb2YgYWxsIG5lZWQgdG8gY29udmluY2UgbWUgdGhhdCB0aGUgYmluYXJ5IHlv
dSBidWlsZCBpcwo+IGEgZHJvcC1pbiByZXBsYWNlbWVudCBmb3IgeGVuLmVmaS4gQXMgbm90ZWQg
aW4gdGhlIHJlcGxpZXMgdG8gZWFybGllcgo+IHBhdGNoZXMsIEknbSBnZXR0aW5nIHRoZSBpbXBy
ZXNzaW9uIG9mIHRoaXMgbm90IGJlaW5nIHRoZSBjYXNlLiBBIGZ1cnRoZXIKPiBoaW50IHRvd2Fy
ZHMgdGhpcyBpcyB0aGUgb3V0cmlnaHQgZGVsZXRpb24gb2YgeGVuL2FyY2gveDg2L2VmaS9ta3Jl
bG9jLmM6Cj4gSG93IGlzIHRoZSBYZW4gaW1hZ2UgZ29pbmcgdG8gYmUgcmVsb2NhdGVkIHRoYXQg
d2F5LCB3aGVuIGxvYWRlZCBmcm9tCj4gdGhlIEVGSSBzaGVsbCBvciBib290IGxvYWRlcj8KCkl0
IHdvcmtzIGJlY2F1c2UgYWxsIGFkZHJlc3NpbmcgaXMgcmVsYXRpdmUgdG8gJXJpcC4gVG8gYmUg
cHJlY2lzZSwgbmV3Cnhlbi5lZmksIGVhcmxpZXIgeGVuLm1iLmVmaSwgY29udGFpbnMgZXhhY3Rs
eSB0aGUgc2FtZSBjb2RlIGFzIEVMRiBkb2VzLgpTbywgaWYgRUxGIHdvcmtzIHdpdGhvdXQgYW55
IHJlbG9jYXRpb25zIHdoeSBQRSBzaG91bGQgbm90LiBFc3BlY2lhbGx5IG9uCng4Ni02NC4gQWRk
aXRpb25hbGx5LCBteSB0ZXN0cyBzaG93ZWQgdGhhdCBpbiBnZW5lcmFsIFVFRkkgaW1wbGVtZW50
YXRpb25zCmp1c3QgcmVxdWlyZSBCYXNlIFJlbG9jYXRpb24gVGFibGUgZW50cnkgaW4gUEUgRGF0
YSBEaXJlY3RvcmllcyB0byByZWxvY2F0ZQp0aGUgaW1hZ2UuIEV2ZW4gaXQgY2FuIGJlIGVtcHR5
LiBBcyBpdCBpcyBpbiBjdXJyZW50IHBhdGNoc2V0LiBUaG91Z2ggSSBhbQphZnJhaWQgYWJvdXQg
bW9yZSBwaWNreSBVRUZJIHN0dWZmIGFuZCBjb25zaWRlcmluZyBhZGRpdGlvbiBvZiBhdCBsZWFz
dApvbmUgLnJlbG9jIGVudHJ5LCBmYWtlIG9uZSwgYXMgTGludXgga2VybmVsIGRvZXMuIEFuZCB0
aGlzIHJpc2VzIGFub3RoZXIKcXVlc3Rpb246IHNob3VsZCBub3Qgd2UgYWRkIC5ic3Mgc2VjdGlv
biBpbnRvIFBFIGhlYWRlcj8gUmlnaHQgbm93IGl0IGlzCmVtYmVkZGVkL2hpZGRlbiBpbiBQRSAu
dGV4dCBzZWN0aW9uLgoKRGFuaWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
