From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH XTF] nested-vmx: exceptions take priority
 over VMFail*
Date: Fri, 11 Jan 2019 17:04:07 +0000
Message-ID: <9a8ee0ad-a3f5-0b6a-59d4-afc060612195@citrix.com>
References: <5C3866DC020000780020C941@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k9WF=PT=citrix.com=prvs=907b43420=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gi0E7-0002Gy-Sn
 for xen-devel@lists.xenproject.org; Fri, 11 Jan 2019 17:04:11 +0000
In-Reply-To: <5C3866DC020000780020C941@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDEvMjAxOSAwOTo1MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhlIHdheSB0aGUgaW5z
dHJ1Y3Rpb24gaW52b2NhdGlvbnMgYXJlIGNvZGVkLCBpdCBpcyBjb21waWxlciB2ZXJzaW9uCj4g
ZGVwZW5kZW50IHdoZXRoZXIgdGhpbmdzIHdvcms6IFdpdGggb2xkIGdjYywgZmFpbF97LGlufXZh
bGlkIHdpbGwgbm90Cj4gZ2V0IHRvdWNoZWQgYW5kIGhlbmNlIHJlbWFpbiBhdCB0aGVpciBpbml0
aWFsIHZhbHVlcywgd2hpbGUgd2l0aCBuZXdlcgo+IGdjYyBldmFsdWF0aW9uIG9mIHRoZSBzdGF0
dXMgZmxhZ3Mgb2NjdXJzIG91dHNpZGUgb2YgdGhlIGFzbSgpLCBpLmUuCj4gYWxzbyB3aGVuIGFu
IGV4Y2VwdGlvbiB3YXMgcmVjZWl2ZWQgKGluIHdoaWNoIGNhc2UgRUZMQUdTIGRpZG4ndCBjaGFu
Z2UKPiBmcm9tIGl0cyB2YWx1ZSBiZWZvcmUgdGhlIGZhdWx0aW5nIGluc3RydWN0aW9uKS4KPgo+
IFNpbmNlIGl0IGlzIG1vcmUgbG9naWNhbCBhbnl3YXkgdG8gY2hlY2sgZm9yIGEgcG9zc2libGUg
ZXhjZXB0aW9uIGZpcnN0LAo+IGRvIHNvIHVuaWZvcm1seSBpbnN0ZWFkIG9mIHRyeWluZyB0byBm
aWRkbGUgd2l0aCB0aGUgYXNtKCkgaW4gc29tZSB3YXkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpPdWNoIC0gdGhhdCBpcyBhIG5hc3R5IGNvcm5l
ciBjYXNlIEkgaGFkbid0IGNvbnNpZGVyZWQgd2l0aCB0aGUKY29uZGl0aW9uIGNvZGUgb3V0cHV0
cy4KClJlaXZld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
