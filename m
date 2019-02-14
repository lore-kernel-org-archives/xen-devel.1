From: William Kucharski <william.kucharski@oracle.com>
Subject: Re: [PATCH v3 1/2] x86: respect memory size limiting
 via mem= parameter
Date: Thu, 14 Feb 2019 04:00:37 -0700
Message-ID: <A93A19ED-0121-4E88-B24E-1593BEBD3384__14590.8277992689$1550142126$gmane$org@oracle.com>
References: <20190214104240.24428-1-jgross@suse.com>
 <20190214104240.24428-2-jgross@suse.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.2\))
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=s5Kz=QV=oracle.com=william.kucharski@srs-us1.protection.inumbo.net>)
 id 1guElM-00083b-3v
 for xen-devel@lists.xenproject.org; Thu, 14 Feb 2019 11:01:04 +0000
In-Reply-To: <20190214104240.24428-2-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: sstabellini@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

Cgo+IE9uIEZlYiAxNCwgMjAxOSwgYXQgMzo0MiBBTSwgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPiB3cm90ZToKPiAKPiBXaGVuIGxpbWl0aW5nIG1lbW9yeSBzaXplIHZpYSBrZXJuZWwg
cGFyYW1ldGVyICJtZW09IiB0aGlzIHNob3VsZCBiZQo+IHJlc3BlY3RlZCBldmVuIGluIGNhc2Ug
b2YgbWVtb3J5IG1hZGUgYWNjZXNzaWJsZSB2aWEgYSBQQ0kgY2FyZC4KPiAKPiBUb2RheSB0aGlz
IGtpbmQgb2YgbWVtb3J5IHdvbid0IGJlIG1hZGUgdXNhYmxlIGluIGluaXRpYWwgbWVtb3J5Cj4g
c2V0dXAgYXMgdGhlIG1lbW9yeSB3b24ndCBiZSB2aXNpYmxlIGluIEU4MjAgbWFwLCBidXQgaXQg
bWlnaHQgYmUKPiBhZGRlZCB3aGVuIGFkZGluZyBQQ0kgZGV2aWNlcyBkdWUgdG8gY29ycmVzcG9u
ZGluZyBBQ1BJIHRhYmxlIGVudHJpZXMuCj4gCj4gTm90IHJlc3BlY3RpbmcgIm1lbT0iIGNhbiBi
ZSBjb3JyZWN0ZWQgYnkgYWRkaW5nIGEgZ2xvYmFsIG1heF9tZW1fc2l6ZQo+IHZhcmlhYmxlIHNl
dCBieSBwYXJzZV9tZW1vcHQoKSB3aGljaCB3aWxsIHJlc3VsdCBpbiByZWplY3RpbmcgYWRkaW5n
Cj4gbWVtb3J5IGFyZWFzIHJlc3VsdGluZyBpbiBhIG1lbW9yeSBzaXplIGFib3ZlIHRoZSBhbGxv
d2VkIGxpbWl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4KPiBBY2tlZC1ieTogSW5nbyBNb2xuYXIgPG1pbmdvQGtlcm5lbC5vcmc+CgpSZXZpZXdl
ZC1ieTogV2lsbGlhbSBLdWNoYXJza2kgPHdpbGxpYW0ua3VjaGFyc2tpQG9yYWNsZS5jb20+CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
