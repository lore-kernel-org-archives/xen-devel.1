From: Christian Lindig <christian.lindig@citrix.com>
Subject: Re: [PATCH 09/20] tools: Rework xc_domain_create() to
 take a full xen_domctl_createdomain
Date: Tue, 20 Mar 2018 19:42:39 +0000
Message-ID: <AB0274AC-14DD-4A19-9036-17FDB645B32D@citrix.com>
References: <1521486839-25617-1-git-send-email-andrew.cooper3@citrix.com>
 <1521486839-25617-10-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1521486839-25617-10-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
Content-ID: <158627DEC8735F469D47B13D575F4573@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, =?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>, Wei Liu <wei.liu2@citrix.com>, Jonathan Ludlam <Jonathan.Ludlam@citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, David Scott <dave@recoil.org>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Cgo+IE9uIDE5LiBNYXIgMjAxOCwgYXQgMTk6MTMsIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+IAo+IEluIGZ1dHVyZSBwYXRjaGVzLCB0aGUgc3RydWN0
dXJlIHdpbGwgYmUgZXh0ZW5kZWQgd2l0aCBmdXJ0aGVyIGluZm9ybWF0aW9uLAo+IGFuZCB0aGlz
IGlzIGZhciBjbGVhbmVyIHRoYW4gYWRkaW5nIGV4dHJhIHBhcmFtZXRlcnMuCj4gCj4gVGhlIHB5
dGhvbiBzdHVicyBhcmUgdGhlIG9ubHkgdXNlciB3aGljaCBwYXNzZXMgTlVMTCBmb3IgdGhlIGV4
aXN0aW5nIGNvbmZpZwo+IG9wdGlvbiAod2hpY2ggaXMgYWN0dWFsbHkgdGhlIGFyY2ggc3Vic3Ry
dWN0dXJlKS4gIFRoZXJlZm9yZSwgdGhlICNpZmRlZmFyeQo+IG1vdmVzIHRvIGNvbXBlbnNhdGUu
Cj4gCj4gRm9yIGxpYnhsLCBwYXNzIHRoZSBmdWxsIGNvbmZpZyBvYmplY3QgZG93biBpbnRvCj4g
bGlieGxfX2FyY2hfZG9tYWluX3twcmVwYXJlLHNhdmV9X2NvbmZpZygpLCBhcyB0aGVyZSBhcmUg
aW4gcHJhY3RpY2UgYXJjaAo+IHNwZWNpZmljIHNldHRpbmdzIGluIHRoZSBjb21tb24gcGFydCBv
ZiB0aGUgc3RydWN0dXJlIChmbGFncyBzM19pbnRlZ3JpdHkgYW5kCj4gb29zX29mZiBzcGVjaWZp
Y2FsbHkpLgo+IAo+IE5vIHByYWN0aWNhbCBjaGFuZ2UgaW4gYmVoYXZpb3VyLgoKQWNrZWQtYnk6
IENocmlzdGlhbiBMaW5kaWcgPGNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbT4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
