From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 13/14] xen/gnttab: Simplify
 gnttab_map_frame()
Date: Thu, 22 Nov 2018 08:48:35 -0700
Message-ID: <5BF6CFD302000078001FF0AC@prv1-mh.provo.novell.com>
References: <1542806482-24030-1-git-send-email-andrew.cooper3@citrix.com>
 <1542806482-24030-14-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542806482-24030-14-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

ID4+PiBPbiAyMS4xMS4xOCBhdCAxNDoyMSwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdy
b3RlOgo+ICogUmVmbG93IHNvbWUgbGluZXMgdG8gcmVtb3ZlIHVubmVjZXNzYXJ5IGxpbmUgYnJl
YWtzLgo+ICAqIEZhY3RvciBvdXQgdGhlIGdudHRhYl9nZXRfZnJhbWVfZ2ZuKCkgY2FsY3VsYXRp
b24uICBOZWl0aGVyIHg4NiBub3IgQVJNCj4gICAgYnVpbGRzIHNlZW0gdG8gYmUgYWJsZSB0byBm
b2xkIHRoZSB0d28gY2FsbHMsIGFuZCB0aGUgcmVzdWx0aW5nIGNvZGUgaXMgZmFyCj4gICAgZWFz
aWVyIHRvIGZvbGxvdy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
