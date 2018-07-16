From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 07/13] libx86: Introduce a helper to
 serialise cpuid_policy objects
Date: Mon, 16 Jul 2018 04:55:20 -0600
Message-ID: <5B4C799802000078001D44E8@prv1-mh.provo.novell.com>
References: <1531512194-6865-1-git-send-email-andrew.cooper3@citrix.com>
 <1531512194-6865-8-git-send-email-andrew.cooper3@citrix.com>
 <20180716091801.lcgno4b4g6h3hgoe@citrix.com>
 <5B4C694F02000078001D43C7@prv1-mh.provo.novell.com>
 <63988cc2-3795-8bc1-66d1-10f55894288d@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <63988cc2-3795-8bc1-66d1-10f55894288d@citrix.com>
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjA3LjE4IGF0IDEyOjM5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTYvMDcvMTggMTA6NDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxNi4w
Ny4xOCBhdCAxMToxOCwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gT24gRnJpLCBK
dWwgMTMsIDIwMTggYXQgMDk6MDM6MDhQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+
PiArI2luY2x1ZGUgPGVycm5vLmg+Cj4+Pj4gICNpbmNsdWRlIDxpbnR0eXBlcy5oPgo+Pj4+ICAj
aW5jbHVkZSA8c3RkYm9vbC5oPgo+Pj4+ICAjaW5jbHVkZSA8c3RkZGVmLmg+Cj4+Pj4gQEAgLTIz
LDYgKzI4LDE5IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCB0ZXN0X2JpdCh1bnNpZ25lZCBpbnQgYml0
LCBjb25zdCB2b2lkIAo+Pj4gKnZhZGRyKQo+Pj4+ICAgICAgcmV0dXJuIGFkZHJbYml0IC8gOF0g
JiAoMXUgPDwgKGJpdCAlIDgpKTsKPj4+PiAgfQo+Pj4+ICAKPj4+PiArLyogbWVtY3B5KCksIGJ1
dCB3aXRoIGNvcHlfdG9fZ3Vlc3Rfb2Zmc2V0KCkncyBBUEkuICovCj4+Pj4gKyNkZWZpbmUgY29w
eV90b19idWZmZXJfb2Zmc2V0KGRzdCwgaW5kZXgsIHNyYywgbnIpICAgICAgXAo+Pj4+ICsoeyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4+
PiArICAgIGNvbnN0IHR5cGVvZigqKGRzdCkpICpzcmNfID0gKHNyYyk7ICAgICAgICAgICAgICAg
ICBcCj4+PiBJIHRoaW5rIHlvdSBtZWFuIHR5cGVvZigqKHNyYykpIGhlcmU/Cj4+IFRvIGZvbGxv
dyBjb3B5X3RvX2d1ZXN0X29mZnNldCgpJ3MgbW9kZWwgdGhlcmUncyBtb3JlIG5lZWRlZCBoZXJl
LAo+PiBJIHRoaW5rOiBkc3QgYW5kIHNyYyB3YW50IHRvIHBvaW50IHRvIHNpbWlsYXIgdHlwZSBv
YmplY3RzIC8gYXJyYXlzIChpLmUuCj4+IHRoZSBtYWNybyB3YW50cyB0byBlbmZvcmNlIHRoaXMp
Lgo+IAo+IFRoaXMgd3JhcHBlciBuZWVkcyB0byBiZSBqdXN0IGVub3VnaCB0byBjb21waWxlIGZv
ciB1c2Vyc3BhY2UuICBJdAo+IGRvZXNuJ3QgbmVlZCBhbGwgdGhlIGZlYXR1cmVzIGFuZCBtaXNm
ZWF0dXJlcyBvZiB0aGUgaHlwZXJ2aXNvcgo+IGltcGxlbWVudGF0aW9uLgo+IAo+IFJlbWVtYmVy
IHRoYXQgdGhlIGNvZGUgZ2V0cyBjb21waWxlZCB0d2ljZSwgc28gdGhlcmUgaXMgbm8gY2hhbmNl
IG9mCj4gZXJyb3JzIGFjdHVhbGx5IHNsaXBwaW5nIGluLgoKV2VsbCwgeWVzLCBwZW9wbGUgd291
bGQgY2VydGFpbmx5IGJlIGV4cGVjdGVkIHRvIHRlc3QgYm90aCBwYXJ0cyBvZgp0aGUgYnVpbGQg
YmVmb3JlIHN1Ym1pdHRpbmcgYSBjaGFuZ2UuIEJ1dCBzb21lb25lIGZvY3VzaW5nIG9uIHRoZQpo
eXBlcnZpc29yIG1pZ2h0IG5vdCBhbHdheXMgcmUtYnVpbGQgdGhlIHRvb2xzIGFmdGVyIGVhY2gg
c3RlcCAob3IKcmVzcGVjdGl2ZWx5IHZpY2UgdmVyc2EpLCB5ZXQgaXQgd291bGQgYmUgbmljZSBp
ZiBhbiBpc3N1ZSB3YXMgbm90aWNhYmxlCnJpZ2h0IGF3YXkgZXZlbiB3aGVuIGRvaW5nIGp1c3Qg
b25lIG9mIHRoZSB0d28gYnVpbGRzLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
