From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] tools/xl: fix uninitialized variable in
	xl_vdispl
Date: Tue, 13 Mar 2018 10:56:35 +0000
Message-ID: <075cc346-6a37-4ee7-6f23-74f2f95ebcd2@citrix.com>
References: <20180313044333.27923-1-cardoe@cardoe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180313044333.27923-1-cardoe@cardoe.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xen.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Oleksandr Grytsov <oleksandr_grytsov@epam.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMTMvMjAxOCAwNDo0MyBBTSwgRG91ZyBHb2xkc3RlaW4gd3JvdGU6Cj4gVGhlIGNvZGUg
YWRkZWQgaW4gN2E0ODYyMmE3OGEwYjQ1MmU4YWZhNTViODQ0MmM5NThhYmQyMjZhNyBjb3VsZCB1
c2UgcmMKPiB1bmluaXRpYWxpemVkIGluIG1haW5fdmRpc3BsYXR0YWNoKCkuCj4gCj4gU2lnbmVk
LW9mZi1ieTogRG91ZyBHb2xkc3RlaW4gPGNhcmRvZUBjYXJkb2UuY29tPgoKSXQgbG9va3MgbGlr
ZSB0aGF0IHdhcyBkZXNpZ25lZCBvbiBwdXJwb3NlIHRvIHVzZSB0aGUgdW5pbml0aWFsaXplZAp3
YXJuaW5ncyB0byBjYXRjaCBwYXRocyB3aGVyZSB0aGUgcmMgd2Fzbid0IHNwZWNpZmljYWxseSBz
ZXQuCgpUaGUgb25seSBwYXRoIHdoZXJlIGl0J3Mgbm90IHNldCBpcyBpZiBkcnlydW5fb25seSBp
cyB0cnVlOyBhbmQgaW4gdGhhdApjYXNlLCB3ZSBwcm9iYWJseSBhY3R1YWxseSB3YW50IGl0IHRv
IHN1Y2NlZWQsIG5vdCBmYWlsLgoKTm8gbWF0dGVyIHdoYXQsIHJjID0gMCBzaG91bGQgYmUgYWRk
ZWQgdG8gdGhlIGRyeXJ1bl9vbmx5IHBhdGguICBJZiB3ZQp3YW50IHRvIG1ha2UgRVJST1JfRkFJ
TCB0aGUgZGVmYXVsdCwgdGhlbiB0aGUgdmFyaW91cyBwbGFjZXMgcmMgaXMgc2V0CnRvIEVSUk9S
X0ZBSUwgc2hvdWxkIGJlIHJlbW92ZWQuCgogLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
