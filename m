From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [Notes for xen summit 2018 design session ]
 Testing/Building with Docker/GitLab
Date: Tue, 24 Jul 2018 08:18:44 +0100
Message-ID: <20180724071844.qjxdpzttazxuryvo@citrix.com>
References: <65A1D88B-2E3A-4DB9-9823-D59D894405C7@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=2t9p=ki=citrix.com=prvs=736d78cd4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fhrar-0006uN-6U
 for xen-devel@lists.xenproject.org; Tue, 24 Jul 2018 07:18:49 +0000
Content-Disposition: inline
In-Reply-To: <65A1D88B-2E3A-4DB9-9823-D59D894405C7@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <Andrii_Anisov@epam.com>, "xudong.hao@intel.com" <xudong.hao@intel.com>, Doug Goldstein <cardoe@cardoe.com>, Dario Faggioli <dfaggioli@suse.com>, Florian Schmidt <Florian.Schmidt@neclab.eu>, "committers@xenproject.org" <committers@xenproject.org>, xen-devel <xen-devel@lists.xenproject.org>, Artem Mygaiev <artem.mygaiev@globallogic.com>, Matt Spencer <Matt.Spencer@arm.com>
List-Id: xen-devel@lists.xenproject.org

U2luY2UgSSBjYW1lIGJhY2sgZnJvbSB0aGUgc3VtbWl0LCBJIGJ1aWx0IGEgYnVuY2ggb2YgbmV3
IGNvbnRhaW5lcnMgYW5kCmVuYWJsZWQgYnVpbGRpbmcgbW9zdCBjb21wb25lbnRzIHdpdGggZ2l0
bGFiIENJLiBUaGUgZG9ja2VyIGJhc2UKc29sdXRpb24gaXMgZGVmaW5pdGVseSBtb3JlIGZsZXhp
YmxlIHRoYW4gVHJhdmlzIGluIHRoYXQgeW91IGNhbgpiYXNpY2FsbHkgaW5zdGFsbCB3aGF0ZXZl
ciBwYWNrYWdlcyB5b3Ugd2FudC4KCkRvdWcncyBjb250YWluZXJpemUgc2NyaXB0IHdhcyBhbHNv
IGNvbW1pdHRlZCBpbiB0cmVlIHRvIHVuaWZ5IGRldmVsb3BlcgphbmQgQ0kgZXhwZXJpZW5jZS4g
Tm93IGEgZGV2ZWxvcGVyIGNhbiB1c2UgdGhlIHNhbWUgZG9ja2VyIGltYWdlIGluCmdpdGxhYiBD
SSB0byBidWlsZCB0ZXN0IHRoZWlyIGNoYW5nZXMuIEkgYWxzbyBzd2l0Y2hlZCBteSBwcmUtY29t
bWl0CmJ1aWxkIHRlc3QgdG8gY29udGFpbmVyLWJhc2UsIHdoaWNoIHdvcmtzIGdyZWF0IGZvciBt
ZS4KCkFzIGZvciBBcm0sIEkgaGF2ZW4ndCBkb25lIGFueXRoaW5nIGR1ZSB0byB0aW1lIGNvbnN0
cmFpbnQuIEJ1dCBJCnN1c3BlY3QgbW9zdCBvZiB0aGUgZG9ja2VyIGZpbGVzIGNhbiBiZSBlYXNp
bHkgYWRhcHRlZCBiZWNhdXNlIHRoZXJlCmlzbid0IHRoYXQgbXVjaCB4ODYgc3BlY2lmaWMgdGhp
bmcgaW4gdGhlbS4KCldlIHN0aWxsIGhhdmVuJ3QgbWFuYWdlZCB0byBnZXQgZ2l0bGFiIENJJ3Mg
ZW1haWxzIHRvIHhlbi1kZXZlbC4gTm90CnN1cmUgd2h5LgoKSSBoYXZlIHdyaXR0ZW4gYSBzbWFs
bCBzY3JpcHQgdG8gc21va2UgdGVzdCBYZW4gd2l0aCBRRU1VLiBJdCBpcwp2ZXJ5IHByaW1pdGl2
ZSwgYnV0IGl0IGlzIGJldHRlciB0aGFuIG5vdGhpbmcuIEkgd2lsbCBmaW5kIHNvbWUgdGltZSB0
bwppbnRlZ3JhdGUgdGhhdCBpbnRvIGdpdGxhYiBhcyB3ZWxsLgoKSSBhbHNvIHdyb3RlIGEgc21h
bGwgc2NyaXB0IHRvIGJ1aWxkIGV2ZXJ5IGNvbW1pdCBmcm9tIGEgZ2l2ZW4gcmFuZ2UuIEl0Cndv
dWxkIGJlIHBvc3NpYmxlIHRvIGludGVncmF0ZSB0aGF0IGludG8gZ2l0bGFiIENJIGFzIHdlbGws
IGJ1dCB0aGF0J3MKZ29pbmcgdG8gZWF0IGEgbG90IG9mIGNwdSB0aW1lLgoKV2VpLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
