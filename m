From: Ian Jackson <ian.jackson@citrix.com>
Subject: [PATCH] xenstore: increase default thread stack size to
	32k
Date: Thu, 22 Feb 2018 11:16:53 +0000
Message-ID: <23182.42661.155867.810718@mariner.uk.xensource.com>
References: <20180221221341.17452-1-jfehlig@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=uojx=fq=citrix.com=prvs=584d65801=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1eoos1-0007zt-LU
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2018 11:17:01 +0000
In-Reply-To: <20180221221341.17452-1-jfehlig@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jim Fehlig <jfehlig@suse.com>
Cc: xen-devel@lists.xenproject.org, wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

SmltIEZlaGxpZyB3cml0ZXMgKCJbUEFUQ0hdIHhlbnN0b3JlOiBpbmNyZWFzZSBkZWZhdWx0IHRo
cmVhZCBzdGFjayBzaXplIHRvIDMyayIpOgo+IE9uIHNldmVyYWwgU2t5bGFrZSBtYWNoaW5lcyBJ
J3ZlIG9ic2VydmVkIHhsIHNlZ2ZhdWx0cyB3aGVuIHJ1bm5pbmcKPiBjcmVhdGUgb3IgZGVzdHJv
eSBzdWJjb21tYW5kcy4gT3RoZXIgc3ViY29tbWFuZHMgbWF5IHNlZ2ZhdWx0IHRvbywKPiBidXQg
SSd2ZSBvbmx5IGxvb2tlZCBhdCBjcmVhdGUgYW5kIGRlc3Ryb3kgd2hpY2ggc2hhcmUgYSBzaW1p
bGFyCj4gYmFja3RyYWNlCgpBY2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNp
dHJpeC5jb20+CgpIb3dldmVyLCBJIGFtIGNvbmNlcm5lZCB0aGF0IHRoaXMgaXNuJ3QgYSB2ZXJ5
IHN5c3RlbWF0aWMgd2F5IG9mCmFkZHJlc3NpbmcgdGhpcyBwcm9ibGVtLiAgSG93IGRvIHdlIGtu
b3cgdGhhdCAzMksgaXMgZW5vdWdoID8KV2UgaGF2ZSBhbHJlYWR5IGluY3JlYXNlZCB0aGlzIG51
bWJlciBvbmNlLgoKQWx0ZXJuYXRpdmVseSwgbWF5YmUgdGhpcyBpYSBhIGJ1ZyBpbiB0aGUgcGxh
dGZvcm0gbGliYyA/CgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
