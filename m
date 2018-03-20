From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/3] x86/pv: Fold
 {compat_}unregister_guest_callback() into its non-compat counterpart
Date: Tue, 20 Mar 2018 12:33:25 +0000
Message-ID: <20180320123325.3jtgoxcjx6qerlhn@MacBook-Pro-de-Roger.local>
References: <1521115122-15824-1-git-send-email-andrew.cooper3@citrix.com>
 <1521115122-15824-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1521115122-15824-3-git-send-email-andrew.cooper3@citrix.com>
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

T24gVGh1LCBNYXIgMTUsIDIwMTggYXQgMTE6NTg6NDFBTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGVzZSBmdW5jdGlvbnMgYXJlIGFsbW9zdCBpZGVudGljYWwuICBUaGV5IGRpZmZl
ciBvbmx5IGluIHRoZSBlcnJvciBlbWl0dGVkCj4gZm9yIHRoZSB1c2Ugb2YgQ0FMTEJBQ0tUWVBF
X3N5c2NhbGwgKHdoaWNoIGlzIGluY29uc2VxdWVudGlhbCB0byBndWVzdHMpLCBhbmQKPiB0aGUg
dHlwZSBvZiB0aGVpciBhcmd1bWVudC4KPiAKPiBIYXZlIHRoZSBjYWxsZXJzIHBhc3MgdGhlIHVu
cmVnLnR5cGUgcGFyYW1ldGVyIGRpcmVjdGx5LCBhdm9pZGluZyB0aGUgbmVlZCBmb3IKPiBkaWZm
ZXJlbnRseSB0eXBlZCBwYXJhbWV0ZXJzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
