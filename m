From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 2/3] x86/pvh: Fixes to convert_pvh_info()
Date: Mon, 21 Jan 2019 15:52:22 +0000
Message-ID: <20190121155222.6ldahzwkjfcsx4om@zion.uk.xensource.com>
References: <1548085041-23786-1-git-send-email-andrew.cooper3@citrix.com>
 <1548085041-23786-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1548085041-23786-3-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMjEsIDIwMTkgYXQgMDM6Mzc6MjBQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBwYW5pYygpIGRvZXNuJ3QgY29udGFpbiBhbnkgY2FsbGVyIGluZm9ybWF0aW9uLCBz
byB0aGUgc3VtIG91dHB1dCBvZjoKPiAKPiAgIChkMSkgKFhFTikKPiAgIChkMSkgKFhFTikgKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgo+ICAgKGQxKSAoWEVOKSBQYW5p
YyBvbiBDUFUgMDoKPiAgIChkMSkgKFhFTikgTWFnaWMgdmFsdWUgaXMgd3Jvbmc6IDMzNmVjNTY4
Cj4gICAoZDEpIChYRU4pICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioK
PiAgIChkMSkgKFhFTikKPiAKPiBpc24ndCBoZWxwZnVsIGF0IGlkZW50aWZ5aW5nIHdoYXQgd2Vu
dCB3cm9uZy4gIFVwZGF0ZSB0aGUgcGFuaWMoKSBzdHJpbmdzIHRvCj4gaWRlbnRpZnkgUFZIIGFu
ZCBhaWQgd2l0aCBkaWFnbm9zdGljcy4KPiAKPiBUaGUgQlVHX09OKCkgY2hlY2sgZm9yIEFSUkFZ
X1NJWkUocHZoX21iaV9tb2RzKSBpcyBvZmYtYnktb25lLCBhbmQgcmVkdW5kYW50Cj4gd2l0aCB0
aGUgZWFybGllciBwYW5pYygpIHdoaWNoIGV4cGxhaW5zIHRoaW5ncyBpbiBtb3JlIGRldGFpbC4g
IERyb3AgaXQuCj4gCj4gRmluYWxseSwgWGVuIHRha2VzIG5yX21vZHVsZXMgIT0gMCB0byBtZWFu
IHRoYXQgbW9kbGlzdF9wYWRkciBpcyB2YWxpZCwgYnV0IGEKPiBjbGV2ZXJseSBjcmFmdGVyZCBQ
Vkggc3RhcnQgaW5mbyBsYXlvdXQgY2FuIGNhdXNlIFhlbiB0byB1c2UgbW9kbGlzdF9wYWRkciBh
dAo+IGdhZGRyIDAsIGluIHZpb2xhdGlvbiBvZiB0aGUgUFZIIHNwZWMuCgpEbyB5b3UgbWVhbiAi
dXNpbmcgZ2FkZHIgMCIgaXMgdmlvbGF0aW9uIG9mIHNwZWM/IEJ1dCBJIGRvbid0IHNlZW0gdG8K
ZmluZCBpdCB3cml0dGVuIGRvd24gaW4gdGhlIGhlYWRlciBmaWxlLgoKV2VpLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
