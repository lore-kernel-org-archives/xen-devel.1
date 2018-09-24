From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 5/5] xen: Disallow variable length arrays
Date: Mon, 24 Sep 2018 14:30:29 +0100
Message-ID: <d2975b6b-b6ed-361c-25a2-e135e5f636d3@arm.com>
References: <1537794003-30851-1-git-send-email-andrew.cooper3@citrix.com>
 <1537794003-30851-6-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1537794003-30851-6-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwOS8yNC8yMDE4IDAyOjAwIFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IFZhcmlhYmxl
IGxlbmd0aCBhcnJheXMgcmVzdWx0IGluIGV4Y2VzcyBzdGFjayB1dGlsaXNhdGlvbiwgd2l0aCBh
IHJpc2sKPiBvZiBzdGFjayBvdmVyZmxvdyBpZiB0aGUgbGVuZ3RoIGlzIHRvbyBsYXJnZS4gIEl0
IGFsc28gcmVzdWx0cyBpbiBmYWlybHkKPiBwb29yIGFzbSBnZW5lcmF0aW9uLCBiZWNhdXNlIG9m
IHJlcXVpcmluZyBhIGRpdmlkZSBhcyBwYXJ0IG9mIHRoZSBzcGFjZQo+IGNhbGN1YXRpb24uCj4g
Cj4gWGVuIG5vIGxvbmdlciBoYXMgYW55IHZhcmlhYmxlIGxlbmd0aCBhcnJheXMsIHNvIHRha2Ug
dGhlIG9wcG9ydHVuaXR5IHRvCj4gZm9ybWFsbHkgZGlzYWxsb3cgdGhlbS4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpBY2tlZC1i
eTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCj4gLS0tCj4gQ0M6IEdlb3Jn
ZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KPiBDQzogSmFuIEJldWxpY2gg
PEpCZXVsaWNoQHN1c2UuY29tPgo+IENDOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53
aWxrQG9yYWNsZS5jb20+Cj4gQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz4KPiBDQzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+Cj4gQ0M6IFdlaSBMaXUgPHdl
aS5saXUyQGNpdHJpeC5jb20+Cj4gQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5j
b20+Cj4gLS0tCj4gICB4ZW4vUnVsZXMubWsgfCAxICsKPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vUnVsZXMubWsgYi94ZW4vUnVsZXMubWsK
PiBpbmRleCBhYzBhOGVhLi5iZDExZTI2IDEwMDY0NAo+IC0tLSBhL3hlbi9SdWxlcy5tawo+ICsr
KyBiL3hlbi9SdWxlcy5tawo+IEBAIC01OCw2ICs1OCw3IEBAIENGTEFHUyArPSAtV2Vycm9yIC1X
cmVkdW5kYW50LWRlY2xzIC1Xbm8tcG9pbnRlci1hcml0aAo+ICAgQ0ZMQUdTICs9IC1waXBlIC1E
X19YRU5fXyAtaW5jbHVkZSAkKEJBU0VESVIpL2luY2x1ZGUveGVuL2NvbmZpZy5oCj4gICBDRkxB
R1MtJChDT05GSUdfREVCVUdfSU5GTykgKz0gLWcKPiAgIENGTEFHUyArPSAnLURfX09CSkVDVF9G
SUxFX189IiRAIicKPiArJChjYWxsIGNjLW9wdGlvbi1hZGQsQ0ZMQUdTLENDLC1XdmxhKQo+ICAg
Cj4gICBpZm5lcSAoJChjbGFuZykseSkKPiAgICMgQ2xhbmcgZG9lc24ndCB1bmRlcnN0YW5kIHRo
aXMgY29tbWFuZCBsaW5lIGFyZ3VtZW50LCBhbmQgZG9lc24ndCBhcHBlYXIgdG8KPiAKCi0tIApK
dWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
