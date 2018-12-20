From: "Woods, Brian" <Brian.Woods@amd.com>
Subject: Re: [PATCH v5 3/4] iommu: elide flushing for higher
 order map/unmap operations
Date: Thu, 20 Dec 2018 19:27:17 +0000
Message-ID: <CY4PR12MB1768285DD6395B2F7DF12F29E5BF0@CY4PR12MB1768.namprd12.prod.outlook.com>
References: <20181217092259.19762-1-paul.durrant@citrix.com>,
 <20181217092259.19762-4-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=p2Gz=O5=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1ga3ye-0002tD-Iq
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 19:27:24 +0000
In-Reply-To: <20181217092259.19762-4-paul.durrant@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, "Suthikulpanit,
 Suravee" <Suravee.Suthikulpanit@amd.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KU2VudDogTW9uZGF5
LCBEZWNlbWJlciAxNywgMjAxOCAzOjIyIEFNClRvOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKQ2M6IFBhdWwgRHVycmFudDsgU3RlZmFubyBTdGFiZWxsaW5pOyBKdWxpZW4gR3JhbGw7
IEFuZHJldyBDb29wZXI7IEdlb3JnZSBEdW5sYXA7IElhbiBKYWNrc29uOyBLb25yYWQgUnplc3p1
dGVrIFdpbGs7IFRpbSBEZWVnYW47IFdlaSBMaXU7IFN1dGhpa3VscGFuaXQsIFN1cmF2ZWU7IFdv
b2RzLCBCcmlhbjsgUm9nZXIgUGF1IE1vbm7DqQpTdWJqZWN0OiBbUEFUQ0ggdjUgMy80XSBpb21t
dTogZWxpZGUgZmx1c2hpbmcgZm9yIGhpZ2hlciBvcmRlciBtYXAvdW5tYXAgb3BlcmF0aW9ucwoK
VGhpcyBwYXRjaCByZW1vdmVzIGFueSBpbXBsaWNpdCBmbHVzaGluZyB0aGF0IG9jY3VycyBpbiB0
aGUgaW1wbGVtZW50YXRpb24Kb2YgbWFwIGFuZCB1bm1hcCBvcGVyYXRpb25zIGFuZCBhZGRzIG5l
dyBpb21tdV9tYXAvdW5tYXAoKSB3cmFwcGVyCmZ1bmN0aW9ucy4gVG8gbWFpbnRhaW4gc2VtYW50
aWNzIG9mIHRoZSBpb21tdV9sZWdhY3lfbWFwL3VubWFwKCkgd3JhcHBlcgpmdW5jdGlvbnMsIHRo
ZXNlIGFyZSBtb2RpZmllZCB0byBjYWxsIHRoZSBuZXcgd3JhcHBlciBmdW5jdGlvbnMgYW5kIHRo
ZW4KcGVyZm9ybSBhbiBleHBsaWNpdCBmbHVzaCBvcGVyYXRpb24uCgpCZWNhdXNlIFZULWQgY3Vy
cmVudGx5IHBlcmZvcm1zIHR3byBkaWZmZXJlbnQgdHlwZXMgb2YgZmx1c2ggZGVwZW5kZW50IHVw
b24Kd2hldGhlciBhIFBURSBpcyBiZWluZyBtb2RpZmllZCB2ZXJzdXMgbWVyZWx5IGFkZGVkIChp
LmUuIHJlcGxhY2luZyBhIG5vbi0KcHJlc2VudCBQVEUpICdpb21tdSBmbHVzaCBmbGFncycgYXJl
IGRlZmluZWQgYnkgdGhpcyBwYXRjaCBhbmQgdGhlCmlvbW11X29wcyBtYXBfcGFnZSgpIGFuZCB1
bm1hcF9wYWdlKCkgbWV0aG9kcyBhcmUgbW9kaWZpZWQgdG8gT1IgdGhlIHR5cGUKb2YgZmx1c2gg
bmVjZXNzYXJ5IGZvciB0aGUgUFRFIHRoYXQgaGFzIGJlZW4gcG9wdWxhdGVkIG9yIGRlcG9wdWxh
dGVkIGludG8KYW4gYWNjdW11bGF0ZWQgZmxhZ3MgdmFsdWUuIFRoZSBhY2N1bXVsYXRlZCB2YWx1
ZSBjYW4gdGhlbiBiZSBwYXNzZWQgaW50bwp0aGUgZXhwbGljaXQgZmx1c2ggb3BlcmF0aW9uLgoK
VGhlIEFSTSBTTU1VIGltcGxlbWVudGF0aW9ucyBvZiBtYXBfcGFnZSgpIGFuZCB1bm1hcF9wYWdl
KCkgY3VycmVudGx5CnBlcmZvcm0gbm8gaW1wbGljaXQgZmx1c2hpbmcgYW5kIHRoZXJlZm9yZSB0
aGUgbW9kaWZpZWQgbWV0aG9kcyBkbyBub3QKYWRqdXN0IHRoZSBmbHVzaCBmbGFncy4KCk5PVEU6
IFRoZSBwZXItY3B1ICdpb21tdV9kb250X2ZsdXNoX2lvdGxiJyBpcyByZXNwZWN0ZWQgYnkgdGhl
CiAgICAgIGlvbW11X2xlZ2FjeV9tYXAvdW5tYXAoKSB3cmFwcGVyIGZ1bmN0aW9ucyBhbmQgdGhl
cmVmb3JlIHRoaXMgbm93CiAgICAgIGFwcGxpZXMgdG8gYWxsIElPTU1VIGltcGxlbWVudGF0aW9u
cyByYXRoZXIgdGhhbiBqdXN0IFZULWQuCgpTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBh
dWwuZHVycmFudEBjaXRyaXguY29tPgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+
CgpBY2tlZC1ieTogQnJpYW4gV29vZHMgPGJyaWFuLndvb2RzQGFtZC5jb20+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
