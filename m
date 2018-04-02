From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v8] new config option vtsc_tolerance_khz to
 avoid TSC emulation
Date: Mon, 2 Apr 2018 09:49:46 +0100
Message-ID: <20180402084946.c6wzq5fjyrsoizy4@citrix.com>
References: <20180401202958.9173-1-olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <20180401202958.9173-1-olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gU3VuLCBBcHIgMDEsIDIwMTggYXQgMTA6Mjk6NThQTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gQWRkIGFuIG9wdGlvbiB0byBjb250cm9sIHdoZW4gdlRTQyBlbXVsYXRpb24gd2lsbCBi
ZSBhY3RpdmF0ZWQgZm9yIGEKPiBkb21VIHdpdGggdHNjX21vZGU9ZGVmYXVsdC4gV2l0aG91dCBz
dWNoIG9wdGlvbiBlYWNoIFRTQyBhY2Nlc3MgZnJvbQo+IGRvbVUgd2lsbCBiZSBlbXVsYXRlZCwg
d2hpY2ggY2F1c2VzIGEgc2lnbmlmaWNhbnQgcGVyZm9tYW5jZSBkcm9wIGZvcgo+IHdvcmtsb2Fk
cyB0aGF0IG1ha2UgdXNlIG9mIHJkdHNjLgo+IAo+IE9uZSBvcHRpb24gdG8gYXZvaWQgdGhlIFRT
QyBvcHRpb24gaXMgdG8gcnVuIGRvbVVzIHdpdGggdHNjX21vZGU9bmF0aXZlLgo+IFRoaXMgaGFz
IHRoZSBkcmF3YmFjayB0aGF0IG1pZ3JhdGluZyBhIGRvbVUgZnJvbSBhICIyLjNHSHoiIGNsYXNz
IGhvc3QKPiB0byBhICIyLjRHSHoiIGNsYXNzIGhvc3QgbWF5IGNoYW5nZSB0aGUgcmF0ZSBhdCB3
aWNoIHRoZSBUU0MgY291bnRlcgo+IGluY3JlYXNlcywgdGhlIGRvbVUgbWF5IG5vdCBiZSBwcmVw
YXJlZCBmb3IgdGhhdC4KPiAKPiBXaXRoIHRoZSBuZXcgb3B0aW9uIHRoZSBob3N0IGFkbWluIGNh
biBkZWNpZGUgaG93IGEgZG9tVSBzaG91bGQgYmVoYXZlCj4gd2hlbiBpdCBpcyBtaWdyYXRlZCBh
Y3Jvc3Mgc3lzdGVtcyBvZiB0aGUgc2FtZSBjbGFzcy4gU2luY2UgdGhlcmUgaXMKPiBhbHdheXMg
c29tZSBqaXR0ZXIgd2hlbiBYZW4gY2FsaWJyYXRlcyB0aGUgY3B1X2toeiB2YWx1ZSwgYWxsIGhv
c3RzIG9mCj4gdGhlIHNhbWUgY2xhc3Mgd2lsbCBtb3N0IGxpa2VseSBoYXZlIHNsaWdodGx5IGRp
ZmZlcmVudCB2YWx1ZXMuIEFzIGEKPiByZXN1bHQgdlRTQyBlbXVsYXRpb24gaXMgdW5hdm9pZGFi
bGUuIERhdGEgY29sbGVjdGVkIGR1cmluZyB0aGUgaW5jaWRlbnQKPiB3aGljaCB0cmlnZ2VyZWQg
dGhpcyBjaGFuZ2Ugc2hvd2VkIGEgaml0dGVyIG9mIHVwIHRvIDIwMCBLSHogYWNyb3NzCj4gc3lz
dGVtcyBvZiB0aGUgc2FtZSBjbGFzcy4KPiAKPiBFeGlzdGluZyBwYWRkaW5nIGZpZWxkcyBhcmUg
cmV1c2VkIHRvIHN0b3JlIHZ0c2Nfa2h6X3RvbGVyYW5jZSBhcyB1MTYuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogT2xhZiBIZXJpbmcgPG9sYWZAYWVwZmxlLmRlPgoKUmV2aWV3ZWQtYnk6IFdlaSBMaXUg
PHdlaS5saXUyQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
