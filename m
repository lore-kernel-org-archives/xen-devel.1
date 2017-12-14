From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 0/8] xen: add pvh guest support
Date: Thu, 14 Dec 2017 12:26:02 +0100
Message-ID: <3e5282dd-c819-5963-52a9-77bc18832ea5__14696.8317487792$1513250824$gmane$org@suse.com>
References: <20171129134650.20102-1-jgross@suse.com>
 <20171130210309.GC16962@olila.local.net-space.pl>
 <48481317-be7a-f91b-8e88-d8270eeee1eb@suse.com>
 <20171201111250.GF16962@olila.local.net-space.pl>
 <20171214111952.GH4531@olila.local.net-space.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20171214111952.GH4531@olila.local.net-space.pl>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Daniel Kiper <daniel.kiper@oracle.com>
Cc: grub-devel@gnu.org, phcoder@gmail.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMTIvMTcgMTI6MTksIERhbmllbCBLaXBlciB3cm90ZToKPiBPbiBGcmksIERlYyAwMSwg
MjAxNyBhdCAxMjoxMjo1MFBNICswMTAwLCBEYW5pZWwgS2lwZXIgd3JvdGU6Cj4+IE9uIEZyaSwg
RGVjIDAxLCAyMDE3IGF0IDA2OjM3OjM3QU0gKzAxMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
PiBPbiAzMC8xMS8xNyAyMjowMywgRGFuaWVsIEtpcGVyIHdyb3RlOgo+Pj4+IE9uIFdlZCwgTm92
IDI5LCAyMDE3IGF0IDAyOjQ2OjQyUE0gKzAxMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4+
IFRoaXMgcGF0Y2ggc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgYm9vdGluZyBMaW51eCBhcyBQVkgg
Z3Vlc3QuCj4+Pj4+Cj4+Pj4+IFNpbWlsYXIgdG8gaTM4Ni94ZW4gYW5kIHg4Nl82NC94ZW4gcGxh
dGZvcm1zIHRoZSBuZXcgaTM4Ni94ZW5wdmgKPj4+Pj4gcGxhdGZvcm0gZ3J1YiBpcyBib290ZWQg
YXMgYSBzdGFuZGFsb25lIGltYWdlIGRpcmVjdGx5IGJ5IFhlbi4KPj4+Pj4KPj4+Pj4gRm9yIGJv
b3RpbmcgTGludXgga2VybmVsIGl0IGlzIHVzaW5nIHRoZSBzdGFuZGFyZCBsaW51eCBrZXJuZWwK
Pj4+Pj4gbG9hZGVyLiBUaGUgb25seSBtb2RpZmljYXRpb24gb2YgdGhlIGxpbnV4IGxvYWRlciBp
cyB0byBwYXNzIHRoZQo+Pj4+PiBBQ1BJIFJTRFAgYWRkcmVzcyB2aWEgYm9vdCBwYXJhbWV0ZXJz
IHRvIHRoZSBrZXJuZWwsIGFzIHRoYXQgdGFibGUKPj4+Pj4gbWlnaHQgbm90IGJlIGxvY2F0ZWQg
YXQgdGhlIHVzdWFsIHBoeXNpY2FsIGFkZHJlc3MganVzdCBiZWxvdyAxTUIuCj4+Pj4+Cj4+Pj4+
IEFzIHRoZSByZWxhdGVkIExpbnV4IGtlcm5lbCBwYXRjaGVzIGFyZSBub3QgeWV0IGFjY2VwdGVk
IHBsZWFzZQo+Pj4+PiB3YWl0IGZvciB0aGlzIHRvIGhhcHBlbiBiZWZvcmUgYXBwbHlpbmcgdGhl
IHNlcmllcy4KPj4+Pgo+Pj4+IFNvLCBtYXkgSSByZXZpZXcgdGhlIHBhdGNoZXMgb3Igc2hvdWxk
IEkgaG9sZCBvbj8gQW5kIGNvdWxkIHlvdQo+Pj4+IHByb3ZpZGUgYSBsaW5rIHRvIHRoZSAiTGlu
dXgga2VybmVsIHBhdGNoZXMiIG1lbnRpb25lZCBhYm92ZT8KPj4+Cj4+PiBQbGVhc2UgcmV2aWV3
IQo+Pgo+PiBXaWxsIGRvIGluIGEgd2VlayBvciBzby4KPiAKPiBTd2FtcGVkIGJ5IHNvbWUgdXJn
ZW50IGludGVybmFsIHdvcmsuIEkgd2lsbCB0cnkgdG8gcmV2aWV3IHRoaXMgYmVmb3JlCj4gWG1h
cyBidXQgaWYgaXQgZG8gbm90IGhhcHBlbiB0aGVuIEkgd2lsbCBkbyBpdCBpbiB0aGUgZmlyc3Qg
aGFsdCBvZgo+IEphbnVhcnkuIFNvcnJ5IGZvciBkZWxheXMuCgpUaGFua3MuCgpCVFc6IHRoZSBM
aW51eCBrZXJuZWwgcGF0Y2hlcyBoYXZlIGJlZW4gYWNjZXB0ZWQgYnkgdGhlIHg4NiBtYWludGFp
bmVycy4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
