From: Mirela Simonovic <mirela.simonovic@aggios.com>
Subject: Re: [PATCH 01/18] xen/arm: Move code that initializes
 VCPU context into a separate function
Date: Wed, 14 Nov 2018 12:45:56 +0100
Message-ID: <CAKPH-Ng8mbxWNXqyT1K8eenqJ6Ck6KZGrqzjm++4d0n6H=CybQ@mail.gmail.com>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-2-git-send-email-mirela.simonovic@aggios.com>
 <b01a0c73-4c1d-1a97-3b46-c9fa102c13d2@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <b01a0c73-4c1d-1a97-3b46-c9fa102c13d2@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Xen Devel <xen-devel@lists.xen.org>, Davorin Mista <dm@aggios.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Saeed Nowshadi <saeed.nowshadi@xilinx.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBOb3YgMTIsIDIwMTggYXQgMjoxNSBQTSBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPiB3cm90ZToKPgo+IEhpIE1pcmVsYSwKPgo+IE9uIDExLzEyLzE4IDExOjMwIEFN
LCBNaXJlbGEgU2ltb25vdmljIHdyb3RlOgo+ID4gRnJvbTogU2FlZWQgTm93c2hhZGkgPHNhZWVk
Lm5vd3NoYWRpQHhpbGlueC5jb20+Cj4gPgo+ID4gVGhlIGFyY2hfc2V0X2luZm9fZ3Vlc3QoKSBo
YXMgY29kZSB0byBpbml0aWFsaXplIHRoZSBjb250ZXh0IG9mIGEgVkNQVS4KPiA+IFdoZW4gYSBW
Q1BVIGlzIHJlc3VtZWQgaXQgbmVlZHMgdG8gZ28gdGhyb3VnaCB0aGUgc2FtZSBjb250ZXh0Cj4g
PiBpbml0aWFsaXphdGlvbiBleGNsdWRpbmcgYWxsIHRoZSB2YWxpZGF0aW9ucyB0aGF0IHRoaXMg
cm91dGluZSBkb2VzLgo+ID4gV2UgbW92ZSB0aGUgYWN0dWFsIFZDUFUgY29udGV4dCBzZXR0aW5n
IGludG8gYSBmdW5jdGlvbiBzbyB0aGF0IGl0IGNhbiBiZQo+ID4gc2hhcmVkIHdpdGggdGhlIHJl
c3VtZSBwYXRoLgo+Cj4gSSB3b3VsZCByYXRoZXIgbm90IGludHJvZHVjZSBhIGZ1bmN0aW9uIHRo
YXQgc2tpcCB2YWxpZGF0aW9uLiBUaGV5IGFyZQo+IGhlcmUgdG8gY2F0Y2ggZXJyb3Igd2hlbiBz
ZXR0aW5nIHVwIHZDUFUgcmVnaXN0ZXJzLiBJZiB0aG9zZSBlcnJvcnMgYXJlCj4gbm90IGNhdWdo
dCwgdGhlbiB0aGUgaHlwZXJ2aXNvciB3aWxsIGxpa2VseSBjcmFzaCBvbiByZXR1cm4gdG8gdGhl
IGd1ZXN0Lgo+CgpPaywgdGhlbiB3ZSBzaG91bGQganVzdCB1c2UgYXJjaF9zZXRfaW5mb19ndWVz
dC4KClRoYW5rcywKTWlyZWxhCgo+IENoZWVycywKPgo+IC0tCj4gSnVsaWVuIEdyYWxsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
