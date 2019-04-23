From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 0/3] stretch fallout: run 32-bit builds
 on 64-bit Linux
Date: Tue, 23 Apr 2019 13:11:36 +0100
Message-ID: <20190423121139.25996-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VyzP=SZ=citrix.com=prvs=009f8e5a5=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hIuHE-0006OX-H6
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 12:11:56 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <paul.durrant@citrix.com>, committers@xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

SSBhbSBnb2luZyB0byBwdXNoIHRoaXMgdG8gb3NzdGVzdCBwcmV0ZXN0IHJpZ2h0IGF3YXkuICBU
aGlzIHByb2JsZW0KaXMgY3VycmVudGx5IGJsb2NraW5nIG9zc3Rlc3QncyBvd24gc2VsZi1wdXNo
LWdhdGUgYW5kIHByZXZlbnRpbmcgbWFueQpvdGhlciBmaXhlcyBmcm9tIG1ha2luZyBpdCBpbi4u
LgoKSWFuIEphY2tzb24gKDMpOgogIHRzLXN5c2xvZy1zZXJ2ZXI6IC0tbm8tc3RkaW4gb3B0aW9u
CiAgc2ctcnVuLWpvYiwgdHMtaG9zdC1pbnN0YWxsOiBOZXcgLS1idWlsZCBvcHRpb24KICBidWls
ZHM6IFJ1biBpMzg2IGJ1aWxkcyBvbiBhbWQ2NCBrZXJuZWxzCgogT3NzdGVzdC9EZWJpYW4ucG0g
fCAzNSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogc2ctcnVuLWpvYiAgICAg
ICAgfCAgMiArLQogdHMtaG9zdC1pbnN0YWxsICAgfCAgOSArKysrKysrKysKIHRzLXN5c2xvZy1z
ZXJ2ZXIgIHwgMTAgKysrKysrKysrLQogNCBmaWxlcyBjaGFuZ2VkLCA1NCBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
