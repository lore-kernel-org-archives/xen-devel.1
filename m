From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 1/5] x86/hvm: Don't shadow the domain
 parameter in hvm_save_cpu_msrs()
Date: Tue, 20 Feb 2018 14:54:18 +0000
Message-ID: <20180220145418.ukfjopl6zbe774ak@MacBook-Pro-de-Roger.local>
References: <1519127923-23539-1-git-send-email-andrew.cooper3@citrix.com>
 <1519127923-23539-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1519127923-23539-2-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBGZWIgMjAsIDIwMTggYXQgMTE6NTg6MzlBTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBjL3MgZDJmODZiZjYwNCB3aGljaCBpbnRyb2R1Y2VkICJzdHJ1Y3QgaHZtX3NhdmVf
ZGVzY3JpcHRvciAqZCIgYWNjaWRlbnRhbGx5Cj4gZW5kZWQgdXAgc2hhZG93aW5nIHRoZSAic3Ry
dWN0IGRvbWFpbiAqZCIgZnVuY3Rpb24gcGFyYW1ldGVyLiAgUmVuYW1lIHRoZQo+IGZvcm1lciB0
byBkZXNjLgo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpXb3VsZCBiZSBuaWNlIHRvIGVu
YWJsZSAtV3NoYWRvdyBidXQgdGhhdCByZXF1aXJlcyBhIGxvdCBtb3JlIG9mIHdvcmsuCgpUaGFu
a3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
