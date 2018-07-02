From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] xen: Plumb an is_priv boolean into
 domain_create()
Date: Mon, 2 Jul 2018 11:20:33 +0100
Message-ID: <958e1dc1-fb4a-4a7b-fce7-843508174a29@arm.com>
References: <1530524687-23679-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1530524687-23679-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAwNy8wMi8yMDE4IDEwOjQ0IEFNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IFRoZSBj
dXJyZW50IG1lY2hhbmlzbSBvZiBzZXR0aW5nIGRvbTAtPmlzX3ByaXZpbGVnZWQgYWZ0ZXIgY29u
c3RydWN0aW9uIG1lYW5zCj4gdGhhdCB0aGUgaXNfY29udHJvbF9kb21haW4oKSBwcmVkaWNhdGUg
cmV0dXJucyBmYWxzZSBkdXJpbmcgY29uc3RydWN0aW9uLgo+IAo+IEluIHBhcnRpY3VsYXIsIHRo
aXMgbWVhbnMgdGhhdCB0aGUgQ1BVSUQgRmF1bHRpbmcgc3BlY2lhbCBjYXNlIGluCj4gaW5pdF9k
b21haW5fbXNyX3BvbGljeSgpIGZhaWxzIHRvIHRha2UgZWZmZWN0LiAgKEluIGFjdHVhbCBmYWN0
LCBmYXVsdGluZwo+IHN1cHBvcnQgaXMgYWR2ZXJ0aXNlZCB0byBkb20wLCBidXQgYXR0ZW1wdGlu
ZyB0byBjb25maWd1cmUgaXQgaXMgc2lsZW50bHkKPiBpZ25vcmVkIGJlY2F1c2Ugb2YgdGhlIGRv
bTAgc3BlY2lhbCBjYXNlIGluIGN0eHRfc3dpdGNoX2xldmVsbGluZygpLikKPiAKPiBUaGlzIGNv
dWxkIGJlIGltcGxlbWVudGVkIHVzaW5nIGEgZmxhZyBpbiB4ZW5fZG9tY3RsX2NyZWF0ZWRvbWFp
biwgYnV0IHVzaW5nCj4gYW4gZXh0cmEgYm9vbGVhbiBwYXJhbWV0ZXIgbGlrZSB0aGlzIG1lYW5z
IHRoYXQgd2UgY2FuJ3QgYWNjaWRlbnRhbGx5IGFsbG93Cj4gZG9tYWluX2NyZWF0ZSgpIHRvIGNy
ZWF0ZSBhIHNlY29uZCBkb20wIGR1ZSB0byBwYXJhbWV0ZXIgbWlzLWF1ZGl0aW5nLgo+IAo+IFdo
aWxlIGFkanVzdGluZyB0aGUgc2V0dGluZyBvZiBkb20wLT5pc19wcml2aWxlZ2VkLCBkcm9wIHRo
ZSByZWR1bmRhbnQgemVyb2luZwo+IG9mIGRvbTAtPnRhcmdldC4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IC0tLQo+IENDOiBK
YW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+Cj4gQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8
c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxA
YXJtLmNvbT4KPiBDQzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiBDQzogUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gQ0M6IFNlcmdleSBEeWFzbGkgPHNl
cmdleS5keWFzbGlAY2l0cml4LmNvbT4KPiAKPiBDb21waWxlIHRlc3RlZCBvbiBBUk0uICBGdW5j
dGlvbmFsbHkgdGVzdGVkIG9uIHg4Ni4KClRoZSBjaGFuZ2VzIGluIG9uIEFybSBsb29rcyBmaW5l
OgoKQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpDaGVlcnMs
CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
