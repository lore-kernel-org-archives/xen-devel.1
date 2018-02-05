From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/emul: Fix the emulation of invlpga
Date: Mon, 05 Feb 2018 06:05:14 -0700
Message-ID: <5A78649A02000078001A5357@prv-mh.provo.novell.com>
References: <1517827080-6171-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1517827080-6171-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Brian Woods <brian.woods@amd.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjAyLjE4IGF0IDExOjM4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhlIGluc3RydWN0aW9uIHJlcXVpcmVzIEVGRVIuU1ZNRSBzZXQgdG8gYmUgdXNhYmxl
IGluIHRoZSBmaXJzdCBwbGFjZS4KPiAKPiBGdXJ0aGVybW9yZSwgdGhlIGVtdWxhdGlvbiBkb2Vz
bid0IGhhbmRsZSBBU0lEcywgc28gYXZvaWQgZ2l2aW5nIHRoZQo+IGltcHJlc3Npb24gdGhhdCB0
aGV5IHdvcmsuICBQZXJtaXQgQVNJRCAwIHdoaWNoIGlzIHJlc2VydmVkIGZvciBub24tcm9vdAo+
IG1vZGUgKGluIHdoaWNoIGNhc2UgdGhlIGluc3RydWN0aW9uIGlzIGlkZW50aWNhbCB0byBpbnZs
cGcpLCBidXQgcmFpc2UgI1VEIGZvcgo+IGFueSBvdGhlciBBU0lELgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
