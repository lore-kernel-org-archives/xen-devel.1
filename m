From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2] makedumpfile: exclude pages that are
 logically offline
Date: Thu, 7 Mar 2019 09:41:15 +0100
Message-ID: <7c9d6d5c-d6cf-00a7-7f23-bf28cbb382af__10858.7117561669$1551948135$gmane$org@redhat.com>
References: <20181122100627.5189-1-david@redhat.com>
 <20181122100938.5567-1-david@redhat.com>
 <4AE2DC15AC0B8543882A74EA0D43DBEC03561800@BPXM09GP.gisp.nec.co.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cfS2=RK=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1h1oai-0001KX-OW
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2019 08:41:24 +0000
In-Reply-To: <4AE2DC15AC0B8543882A74EA0D43DBEC03561800@BPXM09GP.gisp.nec.co.jp>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Kazuhito Hagio <k-hagio@ab.jp.nec.com>
Cc: "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "pv-drivers@vmware.com" <pv-drivers@vmware.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, kexec-ml <kexec@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "devel@linuxdriverproject.org" <devel@linuxdriverproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjcuMTEuMTggMTc6MzIsIEthenVoaXRvIEhhZ2lvIHdyb3RlOgo+PiBMaW51eCBtYXJrcyBw
YWdlcyB0aGF0IGFyZSBsb2dpY2FsbHkgb2ZmbGluZSB2aWEgYSBwYWdlIGZsYWcgKG1hcCBjb3Vu
dCkuCj4+IFN1Y2ggcGFnZXMgZS5nLiBpbmNsdWRlIHBhZ2VzIGluZmF0ZWQgYXMgcGFydCBvZiBh
IGJhbGxvb24gZHJpdmVyIG9yCj4+IHBhZ2VzIHRoYXQgd2VyZSBub3QgYWN0dWFsbHkgb25saW5l
ZCB3aGVuIG9ubGluaW5nIHRoZSB3aG9sZSBzZWN0aW9uLgo+Pgo+PiBXaGlsZSB0aGUgaHlwZXJ2
aXNvciB1c3VhbGx5IGFsbG93cyB0byByZWFkIHN1Y2ggaW5mbGF0ZWQgbWVtb3J5LCB3ZQo+PiBi
YXNpY2FsbHkgcmVhZCBhbmQgZHVtcCBkYXRhIHRoYXQgaXMgY29tcGxldGVseSBpcnJlbGV2YW50
LiBBbHNvLCB0aGlzCj4+IG1pZ2h0IHJlc3VsdCBpbiBxdWl0ZSBzb21lIG92ZXJoZWFkIGluIHRo
ZSBoeXBlcnZpc29yLiBJbiBhZGRpdGlvbiwKPj4gd2Ugc2F3IHNvbWUgcHJvYmxlbXMgdW5kZXIg
SHlwZXItViwgd2hlcmVieSB3ZSBjYW4gY3Jhc2ggdGhlIGtlcm5lbCBieQo+PiBkdW1waW5nLCB3
aGVuIHJlYWRpbmcgbWVtb3J5IG9mIGEgcGFydGlhbGx5IG9ubGluZWQgbWVtb3J5IHNlZ21lbnQK
Pj4gKGZvciBtZW1vcnkgYWRkZWQgYnkgdGhlIEh5cGVyLVYgYmFsbG9vbiBkcml2ZXIpLgo+Pgo+
PiBUaGVyZWZvcmUsIGRvbid0IHJlYWQgYW5kIGR1bXAgcGFnZXMgdGhhdCBhcmUgbWFya2VkIGFz
IGJlaW5nIGxvZ2ljYWxseQo+PiBvZmZsaW5lLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBI
aWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4KPiAKPiBUaGFua3MgZm9yIHRoZSB2MiB1cGRh
dGUuCj4gSSdtIGdvaW5nIHRvIG1lcmdlIHRoaXMgcGF0Y2ggYWZ0ZXIgdGhlIGtlcm5lbCBwYXRj
aGVzIGFyZSBtZXJnZWQKPiBhbmQgaXQgdGVzdHMgZmluZSB3aXRoIHRoZSBrZXJuZWwuCj4gCj4g
S2F6dQoKSGkgS2F6dSwKCnRoZSBwYXRjaGVzIGFyZSBub3cgdXBzdHJlYW0uIFRoYW5rcyEKCi0t
IAoKVGhhbmtzLAoKRGF2aWQgLyBkaGlsZGVuYgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
