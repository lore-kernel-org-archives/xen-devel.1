From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 3/3] xen: add CONFIG item for default
 dom0 memory size
Date: Fri, 18 Jan 2019 13:44:23 +0000
Message-ID: <c9a99390-f0d4-462c-1a01-43dc9798e598@citrix.com>
References: <20181210114422.27275-1-jgross@suse.com>
 <20181210114422.27275-4-jgross@suse.com>
 <e534b651-5d0b-34fb-0f79-9f02ce6d91c4@citrix.com>
 <37d17bc3-0fe8-44eb-51dd-b2a764c6a323@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Lx82=P2=citrix.com=prvs=914ba968d=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gkURg-0004qp-Rb
 for xen-devel@lists.xenproject.org; Fri, 18 Jan 2019 13:44:28 +0000
In-Reply-To: <37d17bc3-0fe8-44eb-51dd-b2a764c6a323@suse.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMDEvMjAxOSAxMzoxOSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAxOC8wMS8yMDE5
IDE0OjEzLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAxMC8xMi8yMDE4IDExOjQ0LCBKdWVy
Z2VuIEdyb3NzIHdyb3RlOgo+Pj4gV2l0aCBiZWluZyBhYmxlIHRvIHNwZWNpZnkgYSBkb20wX21l
bSB2YWx1ZSBkZXBlbmRpbmcgb24gaG9zdCBtZW1vcnkKPj4+IHNpemUgb24geDg2IG1ha2UgaXQg
ZWFzeSBmb3IgZGlzdHJvcyB0byBzcGVjaWZ5IGEgZGVmYXVsdCBkb20wIHNpemUgYnkKPj4+IGFk
ZGluZyBhIENPTkZJR19ET00wX01FTSBpdGVtIHdoaWNoIHByZXNldHMgdGhlIGRvbTBfbWVtIGJv
b3QgcGFyYW1ldGVyCj4+PiB2YWx1ZS4KPj4+Cj4+PiBJdCB3aWxsIGJlIHVzZWQgb25seSBpZiBu
byBkb20wX21lbSBwYXJhbWV0ZXIgd2FzIHNwZWNpZmllZCBpbiB0aGUKPj4+IGJvb3QgcGFyYW1l
dGVycy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+Cj4+PiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiBX
aHkgd2FzIHRoaXMgcGF0Y2ggYWNjZXB0ZWQ/wqAgV2UndmUgYWxyZWFkeSBnb3QgYSBzdWl0YWJs
ZSBLY29uZmlnCj4+IG9wdGlvbiBmb3IgdGhpcywgQ09ORklHX0NNRExJTkUuCj4gV2h5IGRvIHdl
IGhhdmUgYSBjb25maWcgb3B0aW9uIGZvciB0aGUgZGVmYXVsdCBzY2hlZHVsZXI/CgpUaGF0IHBy
ZS1kYXRlcyBDT05GSUdfQ01ETElORSwgYnV0IGlzIG9mIGR1YmlvdXMgdXNlLgoKPgo+IEFuZCBz
b21ldGhpbmcgbGlrZToKPgo+IGRvbTBfbWVtPW1heDo4RyBkb20wX21lbT0xMCUKPgo+IGlzIGRp
ZmZlcmVudCBmcm9tCj4KPiBDT05GSUdfRE9NMF9NRU09Im1heDo4RyIgcGx1cyBkb20wX21lbT0x
MCUKPgo+IG9uIGEgaG9zdCB3aXRoIHNheSAxMDBHIG9mIG1lbW9yeTogSW4gdGhlIGZpcnN0IGNh
c2UgdGhpcyB3b3VsZCBiZSA4RywKPiBpbiB0aGUgc2Vjb25kIGNhc2UgMTBHLgoKQW5kP8KgIFRo
ZXJlIGlzIG5vIHdheSBvZiBwcmV2ZW50aW5nIHRoYXQuCgpBIHVzZXIgY2FuIHJlYWxseSBwdXQg
dHdvIGRvbTBfbWVtPSBvbiB0aGUgcmVhbCBjb21tYW5kIGxpbmUsIGFuZCBjb3VsZApwdXQgYSBk
b20wX21lbSBpbiBDT05GSUdfQ01ETElORS4KClRoZSBvbmx5IHNvbHV0aW9uIHRvIHRoaXMgcHJv
YmxlbSBpcyBmb3IgdGhlIGZpbmFsIGRvbTBfbWVtPSB0byBiZSBhCmZ1bGwgc3BlY2lmaWNhdGlv
biwgYW5kIEkgc3RpbGwgc2VlIG5vIHVzZSBmb3IgQ09ORklHX0RPTTBfTUVNCgp+QW5kcmV3Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
