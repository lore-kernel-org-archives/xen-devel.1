From: Christian Lindig <christian.lindig@citrix.com>
Subject: Re: [PATCH 12/20] xen/domctl: Merge max_vcpus into
 createdomain
Date: Tue, 20 Mar 2018 19:42:32 +0000
Message-ID: <D5D652EA-418C-4059-8C18-3CEC09DC649E@citrix.com>
References: <1521486839-25617-1-git-send-email-andrew.cooper3@citrix.com>
 <1521486839-25617-13-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1521486839-25617-13-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
Content-ID: <E891B77B50BA3F40A5535AC4A9D775F3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: =?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>, Wei Liu <wei.liu2@citrix.com>, Jonathan Ludlam <Jonathan.Ludlam@citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Jan Beulich <JBeulich@suse.com>, David Scott <dave@recoil.org>, Ian Jackson <Ian.Jackson@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

Cgo+IE9uIDE5LiBNYXIgMjAxOCwgYXQgMTk6MTMsIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+IAo+IFhFTl9ET01DVExfbWF4X3ZjcHVzIGlzIGEgbWFu
ZGF0b3J5IGh5cGVyY2FsbCwgYnV0IG5vdGhpbmcgYWN0dWFsbHkgcHJldmVudHMgYQo+IHRvb2xz
dGFjayBmcm9tIHVucGF1c2luZyBhIGRvbWFpbiB3aXRoIG5vIHZjcHVzLgo+IAo+IE9yaWdpbmFs
bHksIGQtPnZjcHVzW10gd2FzIGFuIGVtYmVkZGVkIGFycmF5IGluIHN0cnVjdCBkb21haW4sIGJ1
dCBjL3MKPiBmYjQ0MmUyMTcgIng4Nl82NDogYWxsb3cgbW9yZSB2Q1BVLXMgcGVyIGd1ZXN0IiBp
biBYZW4gNC4wIGFsdGVyZWQgaXQgdG8gYmVpbmcKPiBkeW5hbWljYWxseSBhbGxvY2F0ZWQuICBB
IHNpZGUgZWZmZWN0IG9mIHRoaXMgaXMgdGhhdCBkLT52Y3B1W10gaXMgTlVMTCB1bnRpbAo+IFhF
Tl9ET01DVExfbWF4X3ZjcHVzIGhhcyBjb21wbGV0ZWQsIGJ1dCBhIGxvdCBvZiBoeXBlcmNhbGxz
IGJsaW5kbHkKPiBkZXJlZmVyZW5jZSBpdC4KPiAKPiBFdmVuIHRvZGF5LCB0aGUgYmVoYXZpb3Vy
IG9mIFhFTl9ET01DVExfbWF4X3ZjcHVzIGlzIGEgbWFuZGF0b3J5IHNpbmdsZXRvbgo+IGNhbGwg
d2hpY2ggY2FuJ3QgY2hhbmdlIHRoZSBudW1iZXIgb2YgdmNwdXMgb25jZSBhIHZhbHVlIGhhcyBi
ZWVuIGNob3Nlbi4KPiBUaGVyZWZvcmUsIGRlbGV0ZSBYRU5fRE9NQ1RMX21heF92Y3B1cyAoaW5j
bHVkaW5nIFhTTSBob29rcyBhbmQgdG9vbHN0YWNrCj4gd3JhcHBlcnMpIGFuZCByZXRhaW4gdGhl
IGZ1bmN0aW9uYWxpdHkgaW4gWEVOX0RPTUNUTF9jcmVhdGVkb21haW4uCj4gCj4gVGhpcyB3aWxs
IGFsbG93IGZ1dHVyZSBjbGVhbnVwIHRvIGVuc3VyZSB0aGF0IGQtPnZjcHVzW10gaXMgYWx3YXlz
IHZhbGlkIGZvciBhCj4gbG9jYXRhYmxlIGRvbWFpbiwgYW5kIGFsbG93IHNpbXBsaWZpY2F0aW9u
IG9mIHNvbWUgY3JlYXRpb24gbG9naWMgd2hpY2ggbmVlZHMKPiB0byBzaXplIGRvbWFpbi13aWRl
IG9iamVjdHMgYmFzZWQgb24gbWF4X2NwdXMsIHdoaWNoIGN1cnJlbnRseSBoYXZlIHRvIGJlCj4g
ZGVmZXJyZWQgdW50aWwgdmNwdSBjb25zdHJ1Y3Rpb24uCj4gCj4gRm9yIHRoZSBweXRob24gc3R1
YnMsIGV4dGVuZCB0aGUgZG9tYWluX2NyZWF0ZSBrZXl3b3JkIGxpc3QgdG8gdGFrZSBhCj4gbWF4
X3ZjcHVzIHBhcmFtZXRlciwgaW4gbGlldSBvZiBkZWxldGluZyB0aGUgcHl4Y19kb21haW5fbWF4
X3ZjcHVzIGZ1bmN0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+CgpBY2tlZC1ieTogQ2hyaXN0aWFuIExpbmRpZyA8Y2hyaXN0
aWFuLmxpbmRpZ0BjaXRyaXguY29tPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
