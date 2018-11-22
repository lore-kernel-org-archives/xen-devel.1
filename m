From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 09/14] x86/p2m: Switch the two_gfns
 infrastructure to using gfn_t
Date: Thu, 22 Nov 2018 08:17:46 -0700
Message-ID: <5BF6C89A02000078001FF00A@prv1-mh.provo.novell.com>
References: <1542806482-24030-1-git-send-email-andrew.cooper3@citrix.com>
 <1542806482-24030-10-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542806482-24030-10-git-send-email-andrew.cooper3@citrix.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjExLjE4IGF0IDE0OjIxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMKPiArKysgYi94ZW4vYXJj
aC94ODYvbW0vbWVtX3NoYXJpbmcuYwo+IEBAIC05MDEsOCArOTAxLDggQEAgc3RhdGljIGludCBz
aGFyZV9wYWdlcyhzdHJ1Y3QgZG9tYWluICpzZCwgZ2ZuX3Qgc2dmbiwgc2hyX2hhbmRsZV90IHNo
LAo+ICAgICAgc3RydWN0IHR3b19nZm5zIHRnOwo+ICAgICAgc3RydWN0IHJtYXBfaXRlcmF0b3Ig
cmk7Cj4gIAo+IC0gICAgZ2V0X3R3b19nZm5zKHNkLCBnZm5feChzZ2ZuKSwgJnNtZm5fdHlwZSwg
TlVMTCwgJnNtZm4sCj4gLSAgICAgICAgICAgICAgICAgY2QsIGdmbl94KGNnZm4pLCAmY21mbl90
eXBlLCBOVUxMLCAmY21mbiwKPiArICAgIGdldF90d29fZ2ZucyhzZCwgc2dmbiwgJnNtZm5fdHlw
ZSwgTlVMTCwgJnNtZm4sCj4gKyAgICAgICAgICAgICAgICAgY2QsIGNnZm4sICZjbWZuX3R5cGUs
IE5VTEwsICZjbWZuLAo+ICAgICAgICAgICAgICAgICAgIDAsICZ0Zyk7CgpJIGd1ZXNzIHRoZSBm
dW5jdGlvbiBpbnZvY2F0aW9uIGZpdHMgb24gdHdvIGxpbmVzIG5vdy4gSW4gYW55CmV2ZW50ClJl
dmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpKYW4KCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
