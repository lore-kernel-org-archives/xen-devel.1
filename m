From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 0/3] docs: User oriented documentation
Date: Wed, 20 Mar 2019 11:23:57 +0000
Message-ID: <7bd031df-b291-e9f9-3566-4fb02844eb06@citrix.com>
References: <1553012407-19885-1-git-send-email-andrew.cooper3@citrix.com>
 <20190320112036.GP14641@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20190320112036.GP14641@zion.uk.xensource.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMDMvMjAxOSAxMToyMCwgV2VpIExpdSB3cm90ZToKPiBPbiBUdWUsIE1hciAxOSwgMjAx
OSBhdCAwNDoyMDowNFBNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBUaGlzIGlzIGEg
cHJvamVjdCBJJ3ZlIGJlZW4gbXVzaW5nIG92ZXIgZm9yIGEgbG9uZyB0aW1lIG5vdywgdG8gdHJ5
IGFuZAo+PiBhZGRyZXNzIFhlbidzIGFsbW9zdCBjb21wbGV0ZSBhYnNlbnNlIG9mIGRvY3VtZW50
YXRpb24uCj4+Cj4+IFRoaXMgc2VyaWVzLCBwbHVzIHNvbWUgb3RoZXIgaW4tcHJvZ3Jlc3MgY29u
dmVyc2lvbiBvZiB0aGUgY29tbWFuZCBsaW5lIGRvYywKPj4gaXMgYXZhaWxhYmxlIHRvIHZpZXcg
YXQ6Cj4+Cj4+ICAgaHR0cHM6Ly9hbmRyZXdjb29wLXhlbi5yZWFkdGhlZG9jcy5pby9lbi9sYXRl
c3QvCj4+Cj4+IFRoaXMgaXMgcmVhZC10aGUtZG9jcydzIGF1dG9tYXRpYyBDSSBidWlsZCBvZiBk
b2N1bWVudGF0aW9uIGZyb20gYSBicmFuY2ggb24KPj4gZ2l0bGFiLiAgT2JzZXJ2ZSB0aGF0IHRo
ZSBkb2NzIGRvbid0IGxvb2sgbGlrZSB0aGV5IGFyZSBvdXQgb2YgdGhlIDkwJ3MsIGFuZAo+PiBh
cmUgYXV0b21hdGljYWxseSB0cmFuc2xhdGVkIGludG8gUERGIGFuZCBlUFVCIGZvcm1hdCBhcyB3
ZWxsLgo+Pgo+PiBJbiBkdWUgY291cnNlIEknbGwgc2VlIGFib3V0IHVwZGF0aW5nIHhlbmJpdHMu
eGVuLm9yZy9kb2NzIHRvIHJlbmRlciB0aGlzIGFzCj4+IHdlbGwsIGJ1dCBJIGRvbid0IGhhdmUg
c3VmZmljaWVudCB0dWl0cyBhdCB0aGUgbW9tZW50Lgo+Pgo+PiBBbmRyZXcgQ29vcGVyICgzKToK
Pj4gICBkb2NzL3NwaGlueDogU2tlbGV0b24gc2V0dXAKPj4gICBkb2NzL3JzdDogVXNlIHBhbmRv
YyB0byByZW5kZXIgUmVTdHJ1Y3R1cmVkVGV4dAo+PiAgIGRvY3MvYWRtaW4tZ3VpZGU6IEJvb3Qg
dGltZSBtaWNyb2NvZGUgbG9hZGluZwo+IEkgZG9uJ3QgdGhpbmsgdGhlc2UgY2hhbmdlcyBpbnRy
b2R1Y2UgbmV3IGRlcGVuZGVuY2llcyBpbiB0aGUgYnVpbGQuCj4gQXNzdW1pbmcgbXkgb2JzZXJ2
YXRpb24gaXMgY29ycmVjdDoKPgo+IEFja2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXgu
Y29tPgoKSW4gdGhlIHNob3J0IHRlcm0sIG5vLsKgIEluIGR1ZSBjb3Vyc2UsIHdlJ2xsIG5lZWQg
dmlydHVhbGVudiBhbmQgYSBiaXQKbW9yZSBpbnRlZ3JhdGlvbiBmb3IgYW55b25lIHdhbnRpbmcg
dG8gYnVpbGQgdGhlIHNwaGlueCB0cmVlIGxvY2FsbHksCmJ1dCBJJ20gZmFpcmx5IHN1cmUgd2Ug
Z2V0IHZpcnR1YWxlbnYgYXV0b21hdGljYWxseSBieSBhbHJlYWR5IGhhdmluZwpweXRob24gYXMg
YSBidWlsZCBkZXBlbmRlbmN5LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
