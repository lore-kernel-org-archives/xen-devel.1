From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5 0/10] arm: more kconfig configurability
 and small default configs
Date: Mon, 11 Jun 2018 17:41:49 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1806111741270.14695@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1806041020340.23991@sstabellini-ThinkPad-X260>
 <4a4819eb-42bf-555f-a82f-c8a18864a7e8@arm.com>
 <5B17A46202000078001C8933@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B17A46202000078001C8933@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCA2IEp1biAyMDE4LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+Pj4gT24gMDUuMDYuMTgg
YXQgMTk6NTIsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4gCj4gPiAKPiA+IE9uIDA0
LzA2LzE4IDE4OjIzLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPj4gSGkgYWxsLAo+ID4+
IAo+ID4+IFRoaXMgcGF0Y2ggc2VyaWVzIGlzIHRoZSBmaXJzdCBzdGVwIHRvd2FyZCBidWlsZGlu
ZyBhIHNtYWxsIGNlcnRpZmlhYmxlCj4gPj4gWGVuIGh5cGVydmlzb3IgZm9yIEFSTSBib2FyZHMu
Cj4gPj4gCj4gPj4gRmlyc3QsIHRoZSBzZXJpZXMgbWFrZXMgYSBmZXcgY2hhbmdlcyB0byBhbGxv
dyBkaXNhYmxpbmcgbW9yZSBrY29uZmlnCj4gPj4gb3B0aW9uczogbW9zdCBvZiB0aGVtIGFscmVh
ZHkgZXhpc3QgYnV0IGNhbm5vdCBiZSBkaXNhYmxlZC4KPiA+PiAKPiA+PiBUaGVuLCBpdCBpbnRy
b2R1Y2VzIGEgcmVmZXJlbmNlIGtjb25maWcgZm9yIFJlbmVzYXMgUkNhciAoZHVlIHRvIHBvcHVs
YXIKPiA+PiBkZW1hbmQsIGNhbmRpZGF0ZSBmb3IgY2VydGlmaWNhdGlvbnMpLCBYaWxpbnggTVBT
b0MsIGFuZCBmb3IgUUVNVQo+ID4+IGFhcmNoNjQgKG5vdCBmb3IgY2VydGlmaWNhdGlvbnMsIGJ1
dCB1c2VmdWwgZm9yIGRlYnVnZ2luZykuCj4gPj4gCj4gPj4gVGhlIGxhc3QgcGF0Y2ggaW4gdGhl
IHNlcmllcyBhZGRzIGEgY29udmVuaWVudCBjbG9jIHRhcmdldCB0byBjb3VudCB0aGUKPiA+PiB0
b3RhbCBsaW5lcyBvZiBjb2RlIG9mIHRoZSBzb3VyY2UgZmlsZXMgYnVpbHQuCj4gPj4gCj4gPj4g
QXMgYSBjb25zZXF1ZW5jZSBvZiB0aGVzZSBjaGFuZ2VzLCBzb21lIG9wdGlvbnMgd2lsbCBiZWNv
bWUgdXNlci12aXNpYmxlCj4gPj4gYW5kIG5vdCBkZXBlbmRlbnQgb24gQ09ORklHX0VYUEVSVC4g
SXQgZG9lcyBub3QgbWVhbiB0aGF0IFhlbiBQcm9qZWN0Cj4gPj4gd2lsbCBzZWN1cml0eSBzdXBw
b3J0IGFsbCBwb3NzaWJsZSBjb21iaW5hdGlvbnMgb2Yga2NvbmZpZyBvcHRpb25zLgo+ID4+IElu
c3RlYWQsIHRoZXJlIHdpbGwgYmUgYSBzbWFsbCBzZXQgb2YgcHJlLWNhbm5lZCBjb25maWd1cmF0
aW9ucyB0aGF0Cj4gPj4gd2lsbCBiZSBzdXBwb3J0ZWQuICBTZWU6IGh0dHBzOi8vbWFyYy5pbmZv
Lz9sPXhlbi1kZXZlbCZtPTE1MjQyNDM4OTUxMjQzMiAKPiA+IAo+ID4gR2VvcmdlLCBJYW4sIEph
biwgc2hhbGwgU1VQUE9SVC5NRCBiZSB1cGRhdGVkIHRvIHJlZmxlY3QgdGhlIEtjb25maWcgCj4g
PiBjaGFuZ2VzPwo+ID4gCj4gPiBJIGFtIG1vc3RseSB0aGlua2luZyBhYm91dCB0aGUgYm9hcmQg
c3VwcG9ydCBhbmQgdGhlIGZhY3QgdGhhdCBtb3JlIAo+ID4gb3B0aW9ucyBvbiBBcm0gYXJlIHNl
bGVjdGFibGUgYnkgdGhlIHVzZXJzLgo+IAo+IEkgdGhpbmsgdGhhdCB3b3VsZCBiZSB2ZXJ5IGRl
c2lyYWJsZSwgeWVzLgoKRG8geW91IHdhbnQgbWUgdG8gYWRkIGEgcGF0Y2ggZm9yIHRoYXQgdG8g
dGhpcyBzZXJpZXMsIG9yIHNob3VsZCBJIGRvIGl0CnNlcGFyYXRlbHk/CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
