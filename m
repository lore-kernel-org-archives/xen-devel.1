From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 01/11] tools/libs/toollog: Provide a
 default logger
Date: Thu, 8 Nov 2018 17:40:44 +0000
Message-ID: <54c67aa0-b588-e3d0-d908-145318f9560a@citrix.com>
References: <20181108170805.12774-1-ian.jackson@eu.citrix.com>
 <20181108170805.12774-2-ian.jackson@eu.citrix.com>
 <aba7e30d-63cb-fd76-1544-2cbdcb931233@citrix.com>
 <23524.29245.4775.691541@mariner.uk.xensource.com>
 <a077dcd4-b115-957d-6d9b-e02d8d3ba6a4@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nrah=nt=citrix.com=prvs=843bae1bd=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gKoJW-0005kX-LA
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 17:41:54 +0000
In-Reply-To: <a077dcd4-b115-957d-6d9b-e02d8d3ba6a4@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMTEvMTggMTc6MzEsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMDgvMTEvMTggMTc6
MjgsIElhbiBKYWNrc29uIHdyb3RlOgo+PiBBbmRyZXcgQ29vcGVyIHdyaXRlcyAoIlJlOiBbWGVu
LWRldmVsXSBbUEFUQ0ggdjIgMDEvMTFdIHRvb2xzL2xpYnMvdG9vbGxvZzogUHJvdmlkZSBhIGRl
ZmF1bHQgbG9nZ2VyIik6Cj4+PiBZb3Ugd2FudCBzb21ldGhpbmcgbGlrZToKPj4+Cj4+PiBzdGF0
aWMgeGVudG9vbGxvZ19sb2dnZXJfc3RkaW9zdHJlYW0gc3RkaW9fbG9nZ2VyID0gewo+Pj4gwqDC
oMKgIC52dGFibGUgPSB7Cj4+PiDCoMKgwqDCoMKgwqDCoCAudm1lc3NhZ2UgPSBzdGRpb3N0cmVh
bV92bWVzc2FnZSwKPj4+IMKgwqDCoMKgwqDCoMKgIC5wcm9ncmVzcyA9IHN0ZGlvc3RyZWFtX3By
b2dyZXNzLAo+Pj4gwqDCoMKgwqDCoMKgwqAgLmRlc3Ryb3nCoCA9IDAsIC8qIG5vLW9uZSBzaG91
bGQgZGVzdHJveSB0aGlzICovCj4+PiDCoMKgwqAgfSwKPj4+IMKgwqDCoCAubWluX2xldmVsID0g
WFRMX1BST0dSRVNTLAo+Pj4gwqDCoMKgIC8qIGZvciBvdGhlciBmaWVsZHMgZXhjZXB0IC5mLCAw
IGlzIGdvb2QgKi8KPj4+IH07Cj4+Pgo+Pj4gc3RhdGljIHZvaWQgX19hdHRyaWJ1dGVfXygoX19j
b25zdHJ1Y3Rvcl9fKSkgaW5pdF9zdGRpb19sb2dnZXIodm9pZCkKPj4+IHsKPj4+IMKgwqDCoCBz
dGRpb19sb2dnZXIuZiA9IHN0ZGVycjsKPj4+IH0KPj4gQmxpbWV5LiAgSXMgdGhhdCBwb3J0YWJs
ZSBlbm91Z2ggPwo+IFNob3VsZCBiZS7CoCBJdHMgaG93IEMrKyBnbG9iYWxzIHdvcmssIGFuZCBp
dCBhcHBlYXJzIHRoYXQgd2UgYWxyZWFkeSB1c2UKPiBpdCBpbiB4Y19kb20uaCBmb3IgdGhlIGRv
bWJ1aWxkZXIgcmVnaXN0ZXJfe2xvYWRlcixhcmNoX2hvb2tzfSgpCj4gaW5mcmFzdHJ1Y3R1cmUu
CgpBbHRob3VnaCBhY3R1YWxseSwgeW91IGNhbid0IGNhcHR1cmUgc3RkZXJyIGluIGEgdmFyaWFi
bGUgbGlrZSB0aGlzIGF0CmFsbC7CoCBmcmVvcGVuKCkgYXQgYSBsYXRlciBwb2ludCB3aWxsIGNs
b3NlIHRoZSBjdXJyZW50IEZJTEUgb2JqZWN0IGFuZApjcmVhdGUgYSBuZXcgb25lLCBhZnRlciB3
aGljaCB0aGlzIGxvZ2dlciB3aWxsIHVzZS1hZnRlci1mcmVlLgoKfkFuZHJldwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
