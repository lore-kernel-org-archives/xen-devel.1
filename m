From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 01/18] xen/arm: Move code that initializes
 VCPU context into a separate function
Date: Mon, 12 Nov 2018 13:15:44 +0000
Message-ID: <b01a0c73-4c1d-1a97-3b46-c9fa102c13d2@arm.com>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-2-git-send-email-mirela.simonovic@aggios.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542022244-22977-2-git-send-email-mirela.simonovic@aggios.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mirela Simonovic <mirela.simonovic@aggios.com>, xen-devel@lists.xen.org, xen-devel@lists.xenproject.org
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, dm@aggios.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, saeed.nowshadi@xilinx.com, Jan Beulich <jbeulich@suse.com>, stefano.stabellini@xilinx.com
List-Id: xen-devel@lists.xenproject.org

SGkgTWlyZWxhLAoKT24gMTEvMTIvMTggMTE6MzAgQU0sIE1pcmVsYSBTaW1vbm92aWMgd3JvdGU6
Cj4gRnJvbTogU2FlZWQgTm93c2hhZGkgPHNhZWVkLm5vd3NoYWRpQHhpbGlueC5jb20+Cj4gCj4g
VGhlIGFyY2hfc2V0X2luZm9fZ3Vlc3QoKSBoYXMgY29kZSB0byBpbml0aWFsaXplIHRoZSBjb250
ZXh0IG9mIGEgVkNQVS4KPiBXaGVuIGEgVkNQVSBpcyByZXN1bWVkIGl0IG5lZWRzIHRvIGdvIHRo
cm91Z2ggdGhlIHNhbWUgY29udGV4dAo+IGluaXRpYWxpemF0aW9uIGV4Y2x1ZGluZyBhbGwgdGhl
IHZhbGlkYXRpb25zIHRoYXQgdGhpcyByb3V0aW5lIGRvZXMuCj4gV2UgbW92ZSB0aGUgYWN0dWFs
IFZDUFUgY29udGV4dCBzZXR0aW5nIGludG8gYSBmdW5jdGlvbiBzbyB0aGF0IGl0IGNhbiBiZQo+
IHNoYXJlZCB3aXRoIHRoZSByZXN1bWUgcGF0aC4KCkkgd291bGQgcmF0aGVyIG5vdCBpbnRyb2R1
Y2UgYSBmdW5jdGlvbiB0aGF0IHNraXAgdmFsaWRhdGlvbi4gVGhleSBhcmUgCmhlcmUgdG8gY2F0
Y2ggZXJyb3Igd2hlbiBzZXR0aW5nIHVwIHZDUFUgcmVnaXN0ZXJzLiBJZiB0aG9zZSBlcnJvcnMg
YXJlIApub3QgY2F1Z2h0LCB0aGVuIHRoZSBoeXBlcnZpc29yIHdpbGwgbGlrZWx5IGNyYXNoIG9u
IHJldHVybiB0byB0aGUgZ3Vlc3QuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
