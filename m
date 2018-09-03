From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 1/5] xen/domain: Prepare data for is_{pv,
 hvm}_domain() as early as possible
Date: Mon, 3 Sep 2018 17:47:59 +0100
Message-ID: <20180903164759.ca7vfo7hwej5fjuk@zion.uk.xensource.com>
References: <1535986020-15906-1-git-send-email-andrew.cooper3@citrix.com>
 <1535986020-15906-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1535986020-15906-2-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBTZXAgMDMsIDIwMTggYXQgMDM6NDY6NTZQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBHaXZlbiB0d28gc3VidGxlIGZhaWx1cmVzIGZyb20gZ2V0dGluZyB0aGlzIHdyb25n
IGJlZm9yZSwgYW5kIG1vcmUgY2xlYW51cCBvbgo+IHRoZSB3YXksIG1vdmUgdGhlIHNldHRpbmcg
b2YgZC0+Z3Vlc3RfdHlwZSBhcyBlYXJseSBhcyBwb3NzaWJsZS4KPiAKPiBOb3RlIHRoYXQgZGVz
cGl0ZSBtb3ZpbmcgdGhlIGFzc2lnbm1lbnQgb2YgZC0+Z3Vlc3RfdHlwZSBvdXRzaWRlIG9mIHRo
ZQo+IGlzX2lkbGVfZG9tYWluKGQpIGNoZWNrLCBpdCBzdGlsbCBiZWhhdmVzIHRoZSBzYW1lLiAg
UHJldmlvdXNseSwgc3lzdGVtCj4gZG9tYWlucyBoYWQgbm8gZGlyZWN0IGFzc2lnbm1lbnQgb2Yg
ZC0+Z3Vlc3RfdHlwZSBhbmQgYmVoYXZlZCBhcyBQViBndWVzdHMKPiBiZWNhdXNlIGd1ZXN0X3R5
cGVfcHYgaGFzIHRoZSB2YWx1ZSAwLgo+IAo+IFdoaWxlIHRpZHlpbmcgdXAgdGhlIHByZWRpY2F0
ZSwgbGVhdmUgYSBjb21tZW50IHJlZmVyaW5nIHRvCj4gaXNfc3lzdGVtX2RvbWFpbigpLCBhbmQg
bW92ZSB0aGUgYXNzb2NpYXRlZCBBU1NFUlQoKSB0byBiZSBiZXNpZGUgdGhlCj4gYXNpZ25tZW50
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
