From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.12] x86: Improve the efficiency of
 domain_relinquish_resources()
Date: Thu, 21 Feb 2019 14:11:22 +0100
Message-ID: <7d56d8d5-ac3c-ba72-0996-55549e835960@suse.com>
References: <1550751733-3091-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1550751733-3091-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjEvMDIvMjAxOSAxMzoyMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBwY2lfcmVsZWFzZV9k
ZXZpY2VzKCkgdGFrZXMgdGhlIGdsb2JhbCBQQ0kgbG9jay4gIE9uY2UgcGNpX3JlbGVhc2VfZGV2
aWNlcygpCj4gaGFzIGNvbXBsZXRlZCwgaXQgd2lsbCBiZSBjYWxsZWQgcmVkdW5kYW50bHkgZWFj
aCB0aW1lIHBhZ2luZ190ZWFyZG93bigpIGFuZAo+IHZjcHVfZGVzdHJveV9wYWdldGFibGVzKCkg
Y29udGludWUuCj4gCj4gVGhpcyBpcyBsaWFibGUgdG8gYmUgbWlsbGlvbnMgb2YgdGltZXMgZm9y
IGEgcmVhc29uYWJseSBzaXplZCBndWVzdCwgYW5kIGlzIGEKPiBzZXJpYWxpc2luZyBib3R0bGVu
ZWNrIG5vdyB0aGF0IGRvbWFpbl9raWxsKCkgY2FuIGJlIHJ1biBjb25jdXJyZW50bHkgb24KPiBk
aWZmZXJlbnQgZG9tYWlucy4KPiAKPiBJbnN0ZWFkIG9mIHByb3BhZ2F0aW5nIHRoZSBvcGVuY29k
aW5nIG9mIHRoZSByZWxpbnF1aXNoIHN0YXRlIG1hY2hpbmUsIHRha2UKPiB0aGUgb3Bwb3J0dW5p
dHkgdG8gY2xlYW4gaXQgdXAuCj4gCj4gTGVhdmUgYSBwcm9wZXIgc2V0IG9mIGNvbW1lbnRzIGV4
cGxhaW5pbmcgdGhhdCBkb21haW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMoKQo+IGltcGxlbWVudHMg
YSBjby1yb3V0aW5lLiAgSW50cm9kdWNlIGEgZG9jdW1lbnRlZCBQUk9HUkVTUygpIG1hY3JvIHRv
IGF2b2lkCj4gbGF0ZW50IGJ1Z3Mgc3VjaCBhcyB0aGUgUkVMTUVNX3hlbiBjYXNlLCBhbmQgbWFr
ZSB0aGUgbmV3IFBST0dfKiBzdGF0ZXMKPiBwcml2YXRlIHRvIGRvbWFpbl9yZWxpbnF1aXNoX3Jl
c291cmNlcygpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NA
c3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
