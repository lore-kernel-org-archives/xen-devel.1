From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH v2 06/18] xen: add XEN_GUEST_HANDLE_NULL macros
 for null XEN_GUEST_HANDLE
Date: Wed, 19 Dec 2018 22:39:03 -0800
Message-ID: <1545287955-27684-7-git-send-email-christopher.w.clark@gmail.com>
References: <1545287955-27684-1-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SZmS=O5=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gZrzm-0005tU-ET
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 06:39:46 +0000
Received: by mail-io1-xd42.google.com with SMTP id l22so62802ioh.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Dec 2018 22:39:45 -0800 (PST)
In-Reply-To: <1545287955-27684-1-git-send-email-christopher.w.clark@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBpcyB0byBhc3Npc3QgY29kZSBjbGFyaXR5IGFuZCBhYnN0cmFjdGlvbiBjb25mb3JtYW5j
ZSwgZW5hYmxpbmc6CgogICAgdmFyID0gWEVOX0dVRVNUX0hBTkRMRV9OVUxMKHR5cGUpOwoKaW5z
dGVhZCBvZiBhbiBhYnN0cmFjdGlvbiB2aW9sYXRpb24sIHdoZXJlIHN0cnVjdHVyZSBpcyBhc3N1
bWVkOgoKICAgIHZhciA9ICgoWEVOX0dVRVNUX0hBTkRMRSh0eXBlKSl7KHZvaWQgKikwfSk7Cm9y
OgogICAgdmFyLnAgPSBOVUxMOwoKYW5kIGZvciBjb252ZW5pZW5jZSBmb3Igc3VwcGx5aW5nIGEg
c3VpdGFibHkgdHlwZWQgTlVMTCB2YWx1ZSB0byBhIGZ1bmN0aW9uCnRoYXQgdGFrZXMgYW4gYXJn
dW1lbnQgd2l0aCBhIFhFTl9HVUVTVF9IQU5ETEUgdHlwZS4gZWc6CgogICAgbXlfZnVuY3Rpb24o
Zm9vLCBiYXIsIFhFTl9HVUVTVF9IQU5ETEVfTlVMTCh0eXBlKSk7CgpDODktY29tcGxpYW5jZSBm
b3IgdGhlIHB1YmxpYyBoZWFkZXIgcHJvaGliaXRzIHVzZSBvZiBjb21wb3VuZCBsaXRlcmFscwpz
byBhIGRlY2xhcmF0aW9uIGlzIHJlcXVpcmVkIHByaW9yIHRvIHRoZSBwb2ludCBvZiB1c2luZyB0
aGUgbWFjcm86CgogICAgREVDTEFSRV9YRU5fR1VFU1RfSEFORExFX05VTEwodHlwZSk7CgpUaGlz
IHdpbGwgZGVmaW5lIGEgY29uc3QgdmFyaWFibGUgYXQgdGhlIGdpdmVuIHN0YXRpYyBvciBhdXRv
IHNjb3BlIHdoaWNoIGlzCnRoZW4gdXRpbGl6ZWQgdG8gc3VwcGx5IHRoZSBOVUxMLXdpdGgtY29y
cmVjdC10eXBlIHZhbHVlIHdoZW4KWEVOX0dVRVNUX0hBTkRMRV9OVUxMIGlzIHVzZWQuCgpTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlciBDbGFyayA8Y2hyaXN0b3BoZXIuY2xhcms2QGJhZXN5c3Rl
bXMuY29tPgotLS0KdjEgIzggZmVlZGJhY2sgSmFuOgogICAgcGFyZW50aGVzaXplIFhFTl9HVUVT
VF9IQU5ETEVfTlVMTAogICAgaGVhZGVyIHJlcXVpcmVzIEM4OSBjb21wbGlhbmNlCgogeGVuL2lu
Y2x1ZGUvcHVibGljL3hlbi5oIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL3hlbi5oIGIveGVuL2luY2x1ZGUv
cHVibGljL3hlbi5oCmluZGV4IDBhMjc1NDYuLjVmNGY3NjAgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNs
dWRlL3B1YmxpYy94ZW4uaAorKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMveGVuLmgKQEAgLTk4Miw2
ICs5ODIsMTAgQEAgdHlwZWRlZiBzdHJ1Y3QgewogI2RlZmluZSBYRU5fR1VFU1RfSEFORExFXzY0
KG5hbWUpIFhFTl9HVUVTVF9IQU5ETEUobmFtZSkKICNlbmRpZgogCisjZGVmaW5lIERFQ0xBUkVf
WEVOX0dVRVNUX0hBTkRMRV9OVUxMKHR5cGUpIFwKKyAgICBYRU5fR1VFU1RfSEFORExFKHR5cGUp
IGNvbnN0IF9fZ3Vlc3RfaGFuZGxlXyAjIyB0eXBlICMjIF9OVUxMID0geyh0eXBlICopMH0KKyNk
ZWZpbmUgWEVOX0dVRVNUX0hBTkRMRV9OVUxMKHR5cGUpIChfX2d1ZXN0X2hhbmRsZV8gIyMgdHlw
ZSAjIyBfTlVMTCkKKwogI2lmbmRlZiBfX0FTU0VNQkxZX18KIHN0cnVjdCB4ZW5jdGxfYml0bWFw
IHsKICAgICBYRU5fR1VFU1RfSEFORExFXzY0KHVpbnQ4KSBiaXRtYXA7Ci0tIAoyLjcuNAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
