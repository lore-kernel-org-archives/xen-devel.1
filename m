From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/cpuid: Tie SMAP to NX,
 for the shadow pagetable code
Date: Fri, 26 Oct 2018 09:23:15 -0600
Message-ID: <5BD3316302000078001F54C2@prv1-mh.provo.novell.com>
References: <1539858844-24455-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1539858844-24455-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjEwLjE4IGF0IDEyOjM0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gTlggc3VwcG9ydCBpbiB0aGUgaG9zdCBpcyByZXF1aXJlZCBmb3IgdGhlIHNoYWRvdyBw
YWdldGFibGUgY29kZSB0byBoYW5kbGUKPiBTTUFQIGNvcnJlY3RseSBmb3IgZ3Vlc3RzLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
Cj4gLS0tCj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KPiBDQzogV2VpIExp
dSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+Cj4gQ0M6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAZXUuY2l0cml4
LmNvbT4KPiBDQzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+Cj4gCj4gUkZDIGJlY2F1c2UgdGhp
cyBpcyBhIGxpdHRsZSB0aG9ybnkuCj4gCj4gU3RyaWN0bHkgc3BlYWtpbmcsIGl0IGlzICJYZW4g
dXNlcyBOWCBpbiBIVk0gZ3Vlc3QgY29udGV4dCIgYXMgdGhlCj4gcHJlcmVxdWlzaXRlLiAgV2Ug
Y291bGQgaW4gcHJpbmNpcGxlIGFsbG93IGd1ZXN0cyB0byB1c2UgTlggd2l0aG91dCB1c2luZyBp
dAo+IGluIFhlbiwgYnV0IHRoYXQgc291bmRzIGxpa2UgdW5uZWNlc3NhcnkgY29tcGxpY2F0aW9u
LiAgQWxzbywgd2UgaGF2ZSBubwo+IG9wdGlvbiB0byBpbmhpYml0IFhlbiBmcm9tIHVzaW5nIE5Y
IGlmIGl0IGZpbmRzIGl0IGluIGhhcmR3YXJlLgo+IAo+IFRoaXMgZGVwZW5kZW5jeSBhbHNvIGRv
ZXNuJ3QgbmVlZCB0byBvY2N1ciBmb3IgSEFQIGd1ZXN0cy4KPiAKPiBJbiBwcmFjdGljZSwgYWxs
IDY0Yml0IGhhcmR3YXJlIChzYXZlIHRoZSB2ZXJ5IGZpcnN0IEludGVsIDY0Yml0IENQVXMpCj4g
c3VwcG9ydHMgTlgsIGFuZCBleHByZXNzaW5nIHRoZSBpbnRlcmxvY2sgbGlrZSB0aGlzIGlzIGZh
ciBlYXNpZXIgdGhhbiB0cnlpbmcKPiB0byBhY2NvdW50IGZvciBpdCBkeW5hbWljYWxseS4KCkZp
bmUgd2l0aCBtZSBuZXZlcnRoZWxlc3M6CkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+CgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
