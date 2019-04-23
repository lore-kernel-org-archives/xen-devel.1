From: "Caccavale, Samuel" <samcacc@amazon.com>
Subject: Re: [PATCH fuzzer v1] Added the --ignore-sigill option
 for AFL fuzzing
Date: Tue, 23 Apr 2019 10:12:31 +0000
Message-ID: <1556014350963.34293@amazon.com>
References: <20190418150238.15352-1-samcacc@amazon.de>
 <bf2d1ac9-ae2f-4e37-f7ab-7d21373fb597@citrix.com>
 <1556010631911.24573@amazon.com>,
 <75edc89a-cda7-81ec-afca-1d31f08d6897@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oNSZ=SZ=amazon.com=prvs=009616fed=samcacc@srs-us1.protection.inumbo.net>)
 id 1hIsSH-0004Sf-7F
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 10:15:13 +0000
In-Reply-To: <75edc89a-cda7-81ec-afca-1d31f08d6897@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Sam Caccavale <samcacc@amazon.de>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Pohlack, Martin" <mpohlack@amazon.de>, "Wieczorkiewicz,
 Pawel" <wipawel@amazon.de>, "Woodhouse, David" <dwmw@amazon.co.uk>, Jan Beulich <jbeulich@suse.com>, Martin Mazein <amazein@amazon.de>, "Doebel,
 Bjoern" <doebel@amazon.de>, "Manthey, Norbert" <nmanthey@amazon.de>
List-Id: xen-devel@lists.xenproject.org

WWVzLiAgQ3VycmVudCBzdGFnaW5nIHJlc29sdmVzIGFsbCBvZiB0aGUgU0lHLUlMTCByZWxhdGVk
IGNyYXNoZXMuCgpUYW5nZW50aWFsbHkgSSBoYXZlIH4xMDAwIGNyYXNoZXMgd2hpY2ggZmFpbCB0
aGUgYGN0eHQtPnJlZ3MtPnIoaXApID09IG9yaWdfaXAnCmFzc2VydCBhdCB4ODZfZW11bGF0ZS94
ODZfZW11bGF0ZS5jOjk4NjIgd2hlbiBjb21waWxpbmcgYWZsLWhhcm5lc3Mgc3RhdGljYWxseQp3
aXRoIGFmbC1jbGFuZy1mYXN0LiAgVGhleSBkbyBub3QgcmVwcm9kdWNlIHdoZW4gY29tcGlsZWQg
ZHluYW1pY2FsbHkgb3IKY29tcGlsZWQgaW4gYW55IHdheSB3aXRoIGFmbC1nY2MuCgpJIHdpbGwg
bG9vayBpbnRvIHRoZXNlIGFuZCBvcGVuIGEgbmV3IGVtYWlsIGNoYWluIGlmIHRoaXMgaXMgYSBw
cm9ibGVtIHdpdGggWGVuLAp0aG91Z2ggaXQgbG9va3MgbGlrZSBhbiBhZmwgb3IgbGx2bSBpc3N1
ZS4gIElmIHlvdSBoYXZlIGFueSBpbnNpZ2h0IHRoZW4gcGxlYXNlCmxldCBtZSBrbm93LgoKQmVz
dCwKU2FtIENhY2NhdmFsZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkZyb206IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+ClNlbnQ6IFR1
ZXNkYXksIEFwcmlsIDIzLCAyMDE5IDEyOjAyIFBNClRvOiBDYWNjYXZhbGUsIFNhbXVlbDsgU2Ft
IENhY2NhdmFsZTsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCkNjOiBKYW4gQmV1bGlj
aDsgRG9lYmVsLCBCam9lcm47IFdvb2Rob3VzZSwgRGF2aWQ7IE1hcnRpbiBNYXplaW47IFBvaGxh
Y2ssIE1hcnRpbjsgV2llY3pvcmtpZXdpY3osIFBhd2VsOyBNYW50aGV5LCBOb3JiZXJ0ClN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggZnV6emVyIHYxXSBBZGRlZCB0aGUgLS1pZ25vcmUtc2lnaWxsIG9wdGlv
biBmb3IgQUZMIGZ1enppbmcKCk9uIDIzLzA0LzIwMTkgMTA6MTAsIENhY2NhdmFsZSwgU2FtdWVs
IHdyb3RlOgo+IE15IG1pc3Rha2UsIEknbSBjdXJyZW50bHkgdW5hYmxlIHRvIHJlcHJvZHVjZSB0
aGUgfjEwMCBjcmFzaGVzCj4gQUZMIGZvdW5kIHdoaWxlIGZ1enppbmcgdGhlIG1hc3RlciBicmFu
Y2gsIG9uIHRoZSBjdXJyZW50IHN0YWdpbmcKPiBicmFuY2guICBJdCBzZWVtcyBzb21lIHN0YWdl
ZCBwYXRjaCBoYXMgc2luY2UgYWRkcmVzc2VkIHRoaXMuCj4KPiBJZiBpdCBpcyBvZiBhbnkgaW50
ZXJlc3QsIG1vc3Qgb2YgdGhlIGNyYXNoZXMgY2FtZSBmcm9tIEFWWDUxMgo+IGluc3RydWN0aW9u
cy4KPgo+IFNvcnJ5IGFuZCB0aGFua3MsCgpOb3QgYSBwcm9ibGVtIGluIHRoZSBzbGlnaHRlc3Qu
CgpBcmUgeW91IHNheWluZyB0aGF0IGN1cnJlbnQgc3RhZ2luZyByZXNvbHZlcyBhbGwgdGhlIGNy
YXNoZWQgeW91J2QKZm91bmQ/ICBJZiBub3QsIHBsZWFzZSBkbyByZXBvcnQgdGhlbS4KCn5BbmRy
ZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
