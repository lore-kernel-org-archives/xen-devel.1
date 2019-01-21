From: no-reply@patchew.org
Subject: Re: [Qemu-devel] [PATCH v3 0/4] QEMU changes to do PVH
 boot
Date: Sun, 20 Jan 2019 18:31:58 -0800 (PST)
Message-ID: <154803791641.5550.15254007790773130906__47191.5067792453$1548040734$gmane$org@2d3111e9616b>
References: <1547554687-12687-1-git-send-email-liam.merwick@oracle.com>
Reply-To: qemu-devel@nongnu.org
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Resent-Message-Id: <E1glQ5s-0003Dt-Ki@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o/NS=P5=patchew.org=no-reply@srs-us1.protection.inumbo.net>)
 id 1glQ5r-0003Do-Rr
 for xen-devel@lists.xenproject.org; Mon, 21 Jan 2019 03:17:47 +0000
In-Reply-To: <1547554687-12687-1-git-send-email-liam.merwick@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: liam.merwick@oracle.com
Cc: fam@euphon.net, ehabkost@redhat.com, maran.wilson@oracle.com, mst@redhat.com, qemu-devel@nongnu.org, george.kennedy@oracle.com, stefanha@redhat.com, pbonzini@redhat.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, sgarzare@redhat.com, rth@twiddle.net
List-Id: xen-devel@lists.xenproject.org

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNTQ3NTU0Njg3LTEyNjg3LTEt
Z2l0LXNlbmQtZW1haWwtbGlhbS5tZXJ3aWNrQG9yYWNsZS5jb20vCgoKCkhpLAoKVGhpcyBzZXJp
ZXMgZmFpbGVkIHRoZSBkb2NrZXItbWluZ3dAZmVkb3JhIGJ1aWxkIHRlc3QuIFBsZWFzZSBmaW5k
IHRoZSB0ZXN0aW5nIGNvbW1hbmRzIGFuZAp0aGVpciBvdXRwdXQgYmVsb3cuIElmIHlvdSBoYXZl
IERvY2tlciBpbnN0YWxsZWQsIHlvdSBjYW4gcHJvYmFibHkgcmVwcm9kdWNlIGl0CmxvY2FsbHku
Cgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCnRpbWUgbWFrZSBkb2NrZXIt
dGVzdC1taW5nd0BmZWRvcmEgU0hPV19FTlY9MSBKPTE0Cj09PSBURVNUIFNDUklQVCBFTkQgPT09
CgogIENDICAgICAgZG1hLWhlbHBlcnMubwogIENDICAgICAgdmwubwovdG1wL3FlbXUtdGVzdC9z
cmMvYmxvY2svc2hlZXBkb2cuYzogSW4gZnVuY3Rpb24gJ2ZpbmRfdmRpX25hbWUnOgovdG1wL3Fl
bXUtdGVzdC9zcmMvYmxvY2svc2hlZXBkb2cuYzoxMjM5OjU6IGVycm9yOiAnc3RybmNweScgc3Bl
Y2lmaWVkIGJvdW5kIDI1NiBlcXVhbHMgZGVzdGluYXRpb24gc2l6ZSBbLVdlcnJvcj1zdHJpbmdv
cC10cnVuY2F0aW9uXQogICAgIHN0cm5jcHkoYnVmICsgU0RfTUFYX1ZESV9MRU4sIHRhZywgU0Rf
TUFYX1ZESV9UQUdfTEVOKTsKICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn4KY2MxOiBhbGwgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBl
cnJvcnMKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9s
b2dzLzE1NDc1NTQ2ODctMTI2ODctMS1naXQtc2VuZC1lbWFpbC1saWFtLm1lcndpY2tAb3JhY2xl
LmNvbS90ZXN0aW5nLmRvY2tlci1taW5nd0BmZWRvcmEvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWls
IGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHA6Ly9wYXRjaGV3Lm9yZy9d
LgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
