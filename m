From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen/x86: Fix cflush()'s parameter tracking
Date: Fri, 15 Mar 2019 08:27:40 -0600
Message-ID: <5C8BB65C020000780021F585@prv1-mh.provo.novell.com>
References: <1552659640-24201-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1552659640-24201-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjAzLjE5IGF0IDE1OjIwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gRm9yaW5nIGEgcmVnaXN0ZXIgb3BlcmFuZCBoaWRlcyAoZnJvbSB0aGUgY29tcGlsZXIp
IHRoZSBmYWN0IHRoYXQgY2xmbHVzaAo+IGJlaGF2ZXMgYXMgYSByZWFkIGZyb20gdGhlIG1lbW9y
eSBvcGVyYW5kICh3cnQgbWVtb3J5IG9yZGVyLCBmYXVsdHMsIGV0Yy4pLgo+IEl0IGFsc28gcmVk
dWNlcyB0aGUgY29tcGlsZXJzIGZsZXhpYmlsaXR5IHdpdGggcmVnaXN0ZXIgc2NoZWR1bGxpbmcu
Cj4gCj4gUmVpbXBsZW1lbnQgY2xmdXNoKCkgKGFuZCB3YmludmQoKSBmb3IgY29uc2lzdGVuY3kp
IGFzIGEgc3RhdGljIGlubGluZSByYXRoZXIKPiB0aGFuIGEgbWFjcm8sIGFuZCBoYXZlIGl0IHRh
a2UgYSBjb25zdCB2b2lkIHBvaW50ZXIuCj4gCj4gSW4gcHJhY3RpY2UsIHRoZSBvbmx5IGdlbmVy
YXRlZCBjb2RlIHdoaWNoIGdldHMgbW9kaWZpZWQgYnkgdGhpcyBpcyBpbgo+IG13YWl0X2lkbGVf
d2l0aF9oaW50cygpLCB3aGVyZSBhIG1lbW9yeSBvcGVyYW5kIGNhbiBub3cgYmUgdXNlZC4KPiAK
PiBXaGlsZSBoZXJlLCBJIG5vdGljZWQgdGhhdCAmbXdhaXRfd2FrZXVwKGNwdSkgd2FzIGJlaW5n
IGNhbGN1bGF0ZWQgdHdpY2UuCj4gVGhpcyBpcyBjYXVzZWQgYnkgdGhlIG1lbW9yeSBjbG9iYmVy
IGluIG1iKCksIHNvIHRha2UgdGhlIG9wcG9ydHVuaXR5IHRvIGhlbHAKPiB0aGUgb3B0aW1pc2Vy
IGJ5IGNhbGN1bGF0aW5nIGl0IG9uY2UsIGFoZWFkIG9mIHRpbWUuICBibG9hdC1vLW1ldGVyIHJl
cG9ydHMgYQo+IGRlbHRhIG9mIC0yNiBhcyBhIHJlc3VsdCBvZiB0aGlzIGNoYW5nZS4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoK
UmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
