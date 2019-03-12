From: Julien Grall <julien.grall@arm.com>
Subject: Re: Xen ARM smmu questions
Date: Tue, 12 Mar 2019 11:42:23 +0000
Message-ID: <996e86f5-7059-9fb1-1aa1-734ab760f70a@arm.com>
References: <tencent_4E03A65ACF45B3490239A3A479F5E64FA506@qq.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=05AI=RP=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h3fne-00019T-Jy
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2019 11:42:26 +0000
In-Reply-To: <tencent_4E03A65ACF45B3490239A3A479F5E64FA506@qq.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: jinchen <jinchen1227@qq.com>, xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAzLzEyLzE5IDg6NTggQU0sIGppbmNoZW4gd3JvdGU6Cj4gSGVsbG8geGVuLWRldmVsLAoK
SGVsbG8sCgo+IEknbSByZWFkaW5nIHRoZSBjb2RlIG9mIHhlbiBhcm0gc21tdSBpbiBkcml2ZXJz
L3Bhc3N0aHJvdWdoL2FybSwgYW5kIEkgCj4gaGF2ZSBzb21lIHF1ZXN0aW9ucyB0aGF0IGNvbmZ1
c2VkIG1lLgo+IEkgdGhpbmsgaWYgdGhlIGJvYXJkIHVzZSBTTU1VLCB4ZW4gd2lsbCB0YWtlIGNo
YXJnZSBvZiBpdCBiZWZvcmUgZG9tMCAKPiBib290LCBhbmQgd2lsbCBub3QgcGFzcyB0aGUgbm9k
ZSBvZiBTTU1VIHRvIGRvbTAgaW4gZGV2aWNlIHRyZWUsCj4gc28gbXkgcXVlc3Rpb24gaXMgaG93
IGRvbTAgdXNlIFNNTVU/IG9yIGNhbiBkb20wIHVzZSBTTU1VPyBXaGF0IGRvbTAgdXNlIAo+IGlm
IGl0IHdhbnRzIHRvIHVzZSBJT01NVT8KPiBXaGF0IGFib3V0IGRvbVU/IFRoZSBTTU1VIGNvdWxk
IGJlIHBhc3NlZCB0byBkb21VPwoKU29tZSBTTU1VIGFyZSBhYmxlIHRvIHByb3ZpZGUgU3RhZ2Ug
MSAoR3Vlc3QgVkEgdG8gR3Vlc3QgUEEpIGFuZCBTdGFnZSAyIAooR3Vlc3QgUEEgdG8gSG9zdCBQ
QSkgc3VwcG9ydC4gSW4gdGhlIGN1cnJlbnQgY29uZmlndXJhdGlvbiwgWGVuIHdpbGwgCnVzZSB0
aGUgU3RhZ2UgMiBwYXJ0IHRvIGlzb2xhdGUgZGV2aWNlIHBhc3N0aHJvdWdoLiBTdGFnZSAxIGlz
IG5vdCAKc3VwcG9ydGVkLgoKSWYgeW91IHdhbnRlZCBhIGd1ZXN0IHRvIHVzZSB0aGUgU01NVSwg
eW91IHdvdWxkIGVpdGhlciBuZWVkIHRvIHByb3ZpZGUgClN0YWdlIDEgc3VwcG9ydCAocmVxdWly
ZXMgSFcgc3VwcG9ydCkgb3IgYSBQViBJT01NVS4KCkFsdGVybmF0aXZlbHksIHlvdSBtaWdodCBi
ZSBhYmxlIHRvIGdpdmUgdGhlIFNNTVUgdG8gRG9tMC4gSSBoYXZlbid0IApleHBsb3JlZCBpdCBz
byBmYXIuIERvIHlvdSBoYXZlIGEgdXNlIGNhc2UgZm9yIHVzaW5nIHRoZSBJT01NVSBpbiBndWVz
dD8KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
