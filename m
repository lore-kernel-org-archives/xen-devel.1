From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 for-4.12] x86/hvm: Fix bit checking for
 CR4 and MSR_EFER
Date: Mon, 28 Jan 2019 09:49:47 -0700
Message-ID: <5C4F32AB0200007800211D8F@prv1-mh.provo.novell.com>
References: <1548693659-28825-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1548693659-28825-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjAxLjE5IGF0IDE3OjQwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQmVmb3JlIHRoZSBjcHVpZF9wb2xpY3kgbG9naWMgY2FtZSBhbG9uZywgJWNyNC9FRkVS
IGF1ZGl0aW5nIG9uIG1pZ3JhdGUtaW4gd2FzCj4gY29tcGxpY2F0ZWQsIGJlY2F1c2UgYXQgdGhh
dCBwb2ludCBubyBDUFVJRCBpbmZvcm1hdGlvbiBoYWQgYmVlbiBzZXQgZm9yIHRoZQo+IGd1ZXN0
LiAgQXVkaXRpbmcgYWdhaW5zdCB0aGUgaG9zdCBDUFVJRCB3YXMgYmV0dGVyIHRoYW4gbm90aGlu
ZywgYnV0IG5vdAo+IGlkZWFsLgo+IAo+IFNpbWlsYXJseSBhdCB0aGUgdGltZSwgUFZIdjEgbGFj
a2VkIHRoZSAiQ1BVSUQgcGFzc2VkIHRocm91Z2ggZnJvbSBoYXJkd2FyZSIKPiBiZWhhdmlvdXIg
d2l0aCBQViBndWVzdHMgaGFkLCBhbmQgUFZIIGRvbTAgaGFkIHRvIGJlIHNwZWNpYWwtY2FzZWQg
dG8gYmUgYWJsZQo+IHRvIGJvb3QuCj4gCj4gT3JkZXIgb2YgaW5mb3JtYXRpb24gaW4gdGhlIG1p
Z3JhdGlvbiBzdHJlYW0gaXMgc3RpbGwgYW4gaXNzdWUgKGhlbmNlIHdlIHN0aWxsCj4gbmVlZCB0
byBrZWVwIHRoZSByZXN0b3JlIHBhcmFtZXRlciB0byBjb3BlIHdpdGggYSBuZXN0ZWQgdmlydCBj
b3JuZXIgY2FzZSBpbgo+IHRoZSAlY3I0IGNhc2UpLCBidXQgc2luY2UgWGVuIDQuOSwgYWxsIGRv
bWFpbnMgc3RhcnQgd2l0aCBhIHN1aXRhYmxlIENQVUlECj4gcG9saWN5LCB3aGljaCBpcyBhIG1v
cmUgYXBwcm9wcmlhdGUgdXBwZXIgYm91bmQgdGhhbiBob3N0X2NwdWlkX3BvbGljeS4KPiAKPiBG
aW5hbGx5LCByZXBvc2l0aW9uIHRoZSBVTUlQIGxvZ2ljIGFzIGl0IGlzIHRoZSBvbmx5IHJvdyBv
dXQgb2Ygb3JkZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
