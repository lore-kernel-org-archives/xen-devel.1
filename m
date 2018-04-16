From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.11] x86/msr: Correct the emulation
 behaviour of MSR_PRED_CMD
Date: Mon, 16 Apr 2018 05:12:22 -0600
Message-ID: <5AD4851602000078001BB9D6@prv1-mh.provo.novell.com>
References: <1523876188-14872-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1523876188-14872-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjA0LjE4IGF0IDEyOjU2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhlIGJlaGF2aW91ciBvZiByZXNlcnZlZCBiaXRzIGluIE1TUl9QUkVEX0NNRCBjaGFu
Z2VkIGJldHdlZW4gYmV0YSBhbmQKPiBwcm9kdWN0aW9uIG1pY3JvY29kZSwgYW5kIG5vdyByYWlz
ZXMgYSAjR1AgZmF1bHQgZm9yIHNldCByZXNlcnZlZCBiaXRzLgoKSW50ZXJlc3RpbmcgLSBxdWl0
ZSB1bmZvcnR1bmF0ZSBhIGNoYW5nZS4gUGx1cyAtIEkgY2FuJ3QgZmluZCB3aGVyZSB0aGlzIGlz
IGJlaW5nCnNhaWQuCgo+IFRoZSBBTUQgc3BlYyBmb3IgZnV0dXJlIGhhcmR3YXJlIGFsc28gc3Bl
Y2lmaWVzIHRoaXMgYmVoYXZpb3VyLgoKSSBjYW4gZmluZCB0aGlzIG9uZSAoYWxiZWl0IG5vdCBp
biB0aGUgUFJNKS4KCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4KCldpdGggc29tZSBjbGFyaWZpY2F0aW9uIG9uIHRoZSBvcmlnaW4gb2Yg
dGhlIEludGVsIHJlbGF0ZWQgaW5mb3JtYXRpb24KUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
