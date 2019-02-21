From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH for-4.12] x86: Improve the efficiency of
 domain_relinquish_resources()
Date: Thu, 21 Feb 2019 13:31:11 +0000
Message-ID: <20190221133111.mckklesaynbr4hxa@zion.uk.xensource.com>
References: <1550751733-3091-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1550751733-3091-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBGZWIgMjEsIDIwMTkgYXQgMTI6MjI6MTNQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBwY2lfcmVsZWFzZV9kZXZpY2VzKCkgdGFrZXMgdGhlIGdsb2JhbCBQQ0kgbG9jay4g
IE9uY2UgcGNpX3JlbGVhc2VfZGV2aWNlcygpCj4gaGFzIGNvbXBsZXRlZCwgaXQgd2lsbCBiZSBj
YWxsZWQgcmVkdW5kYW50bHkgZWFjaCB0aW1lIHBhZ2luZ190ZWFyZG93bigpIGFuZAo+IHZjcHVf
ZGVzdHJveV9wYWdldGFibGVzKCkgY29udGludWUuCj4gCj4gVGhpcyBpcyBsaWFibGUgdG8gYmUg
bWlsbGlvbnMgb2YgdGltZXMgZm9yIGEgcmVhc29uYWJseSBzaXplZCBndWVzdCwgYW5kIGlzIGEK
PiBzZXJpYWxpc2luZyBib3R0bGVuZWNrIG5vdyB0aGF0IGRvbWFpbl9raWxsKCkgY2FuIGJlIHJ1
biBjb25jdXJyZW50bHkgb24KPiBkaWZmZXJlbnQgZG9tYWlucy4KPiAKPiBJbnN0ZWFkIG9mIHBy
b3BhZ2F0aW5nIHRoZSBvcGVuY29kaW5nIG9mIHRoZSByZWxpbnF1aXNoIHN0YXRlIG1hY2hpbmUs
IHRha2UKPiB0aGUgb3Bwb3J0dW5pdHkgdG8gY2xlYW4gaXQgdXAuCj4gCj4gTGVhdmUgYSBwcm9w
ZXIgc2V0IG9mIGNvbW1lbnRzIGV4cGxhaW5pbmcgdGhhdCBkb21haW5fcmVsaW5xdWlzaF9yZXNv
dXJjZXMoKQo+IGltcGxlbWVudHMgYSBjby1yb3V0aW5lLiAgSW50cm9kdWNlIGEgZG9jdW1lbnRl
ZCBQUk9HUkVTUygpIG1hY3JvIHRvIGF2b2lkCj4gbGF0ZW50IGJ1Z3Mgc3VjaCBhcyB0aGUgUkVM
TUVNX3hlbiBjYXNlLCBhbmQgbWFrZSB0aGUgbmV3IFBST0dfKiBzdGF0ZXMKPiBwcml2YXRlIHRv
IGRvbWFpbl9yZWxpbnF1aXNoX3Jlc291cmNlcygpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogV2VpIExp
dSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
